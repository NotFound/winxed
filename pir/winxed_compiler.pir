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

# Constant INDENT evaluated at compile time
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


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 782
# Body
# {
.annotate 'line', 784
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 785

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 786
# Body
# {
.annotate 'line', 788
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 789

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 790
# Body
# {
.annotate 'line', 792
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 793

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 794
# Body
# {
.annotate 'line', 796
    self.'say'("    if ", __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 797

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 798
# Body
# {
.annotate 'line', 800
    self.'say'("    unless ", __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 801

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 802
# Body
# {
.annotate 'line', 804
    self.'say'("    if_null ", __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 805

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
.annotate 'line', 806
# Body
# {
.annotate 'line', 808
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 809

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
.annotate 'line', 811
# Body
# {
.annotate 'line', 813
    self.'say'("    inc ", __ARG_1)
# }
.annotate 'line', 814

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
.annotate 'line', 815
# Body
# {
.annotate 'line', 817
    self.'say'("    dec ", __ARG_1)
# }
.annotate 'line', 818

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 819
# Body
# {
.annotate 'line', 821
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 822

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 823
# Body
# {
.annotate 'line', 825
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 826

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 827
# Body
# {
.annotate 'line', 829
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 830

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 831
# Body
# {
.annotate 'line', 833
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 834

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 835
# Body
# {
.annotate 'line', 837
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 838

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 839
# Body
# {
.annotate 'line', 841
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 842

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 843
# Body
# {
.annotate 'line', 845
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 846

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 847
# Body
# {
.annotate 'line', 849
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 850

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 851
# Body
# {
.annotate 'line', 853
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 854

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 855
# Body
# {
.annotate 'line', 857
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 858

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 859
# Body
# {
.annotate 'line', 861
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 862

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 863
# Body
# {
.annotate 'line', 865
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 866

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 867
# Body
# {
.annotate 'line', 869
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 870

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 871
# Body
# {
.annotate 'line', 873
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 874

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
.annotate 'line', 875
# Body
# {
.annotate 'line', 877
    self.'say'("    print ", __ARG_1)
# }
.annotate 'line', 878

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
.annotate 'line', 879
# Body
# {
.annotate 'line', 881
    self.'say'("    say ", __ARG_1)
# }
.annotate 'line', 882

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 883
# Body
# {
.annotate 'line', 885
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 886

.end # emitfind_lex

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
.annotate 'line', 893
# Body
# {
.annotate 'line', 895
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 896

.end # integerValue


.sub 'floatValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
.annotate 'line', 898
# Body
# {
.annotate 'line', 900
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 901
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 902

.end # floatValue


.sub 'floatresult'
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 904
# Body
# {
.annotate 'line', 910
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_2
    iseq $I1, __ARG_2, 'I'
 __label_2:
 __label_1:
    if $I1 goto __label_0
.annotate 'line', 911
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_3
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_4
    iseq $I1, __ARG_1, 'I'
 __label_4:
 __label_3:
 __label_0:
.annotate 'line', 912
    .return($I1)
# }
.annotate 'line', 913

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
.annotate 'line', 934
# Body
# {
.annotate 'line', 936
# pos: $I1
# predefined indexof
    index $I1, __ARG_2, '{res}'
.annotate 'line', 937
    iseq $I2, __ARG_1, 'v'
    unless $I2 goto __label_1
    isne $I2, $I1, -1
 __label_1:
    unless $I2 goto __label_0
.annotate 'line', 938
    'InternalError'('void predef with {res}')
 __label_0: # endif
.annotate 'line', 939
    isne $I2, __ARG_1, 'v'
    unless $I2 goto __label_3
    iseq $I2, $I1, -1
 __label_3:
    unless $I2 goto __label_2
.annotate 'line', 940
    'InternalError'('non void predef without {res}')
 __label_2: # endif
.annotate 'line', 941
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 942
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 943

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.annotate 'line', 944
# Body
# {
.annotate 'line', 946
# body: $S1
    getattribute $P1, self, 'body'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 947
# typeresult: $S2
    getattribute $P1, self, 'typeresult'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 949
# pos: $I1
    null $I1
.annotate 'line', 950
    ne $S2, 'v', __label_2
# {
.annotate 'line', 951
    isnull $I5, __ARG_3
    not $I5
    unless $I5 goto __label_5
    isne $I5, __ARG_3, ''
 __label_5:
    unless $I5 goto __label_4
.annotate 'line', 952
    'SyntaxError'('using return value from void predef')
 __label_4: # endif
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 955
    isnull $I5, __ARG_3
    if $I5 goto __label_7
    iseq $I5, __ARG_3, ''
 __label_7:
    unless $I5 goto __label_6
.annotate 'line', 956
    'InternalError'('Bad result in non void predef')
 __label_6: # endif
 __label_9: # while
.annotate 'line', 957
# predefined indexof
    index $I1, $S1, '{res}'
    eq $I1, -1, __label_8
.annotate 'line', 958
# predefined replace
    replace $S1, $S1, $I1, 5, __ARG_3
    goto __label_9
 __label_8: # endwhile
# }
 __label_3: # endif
.annotate 'line', 961
# n: $I2
    set $P1, __ARG_4
    set $I2, $P1
# for loop
.annotate 'line', 962
# i: $I3
    null $I3
 __label_12: # for condition
    ge $I3, $I2, __label_11
# {
.annotate 'line', 963
# argmark: $S3
    set $S6, $I3
    concat $S5, '{arg', $S6
    concat $S3, $S5, '}'
.annotate 'line', 964
# l: $I4
# predefined length
    length $I4, $S3
.annotate 'line', 965
# arg: $S4
    $S4 = __ARG_4[$I3]
 __label_14: # while
.annotate 'line', 966
# predefined indexof
    index $I1, $S1, $S3
    eq $I1, -1, __label_13
.annotate 'line', 967
# predefined replace
    replace $S1, $S1, $I1, $I4, $S4
    goto __label_14
 __label_13: # endwhile
# }
 __label_10: # for iteration
.annotate 'line', 962
    inc $I3
    goto __label_12
 __label_11: # for end
.annotate 'line', 969
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 970
# predefined split
    split $P1, "\n", $S1
# predefined join
    join $S5, "\n    ", $P1
    concat $S6, '    ', $S5
    __ARG_1.'say'($S6)
# }
.annotate 'line', 971

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 932
    addattribute $P0, 'body'
.annotate 'line', 933
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
.annotate 'line', 985
# Body
# {
.annotate 'line', 992
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 993
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_0
.annotate 'line', 994
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 996
    setattribute self, 'body', __ARG_2
 __label_1: # endif
.annotate 'line', 997
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 998
# n: $I1
    null $I1
.annotate 'line', 999
    if_null __ARG_4, __label_2
# {
.annotate 'line', 1000
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
.annotate 'line', 1001
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_5
    set $S2, '!'
    if $S1 == $S2 goto __label_6
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 1003
    set $I1, -1
    goto __label_3 # break
 __label_6: # case
.annotate 'line', 1006
    set $I1, -2
.annotate 'line', 1007
    if_null __ARG_5, __label_7
.annotate 'line', 1008
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    'InternalError'($S3)
 __label_7: # endif
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 1011
    set $I1, 1
.annotate 'line', 1012
    if_null __ARG_5, __label_8
# {
.annotate 'line', 1013
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1014
    inc $I1
# }
 __label_8: # endif
.annotate 'line', 1016
    if_null __ARG_6, __label_9
# {
.annotate 'line', 1017
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1018
    inc $I1
# }
 __label_9: # endif
.annotate 'line', 1020
    if_null __ARG_7, __label_10
# {
.annotate 'line', 1021
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1022
    inc $I1
# }
 __label_10: # endif
 __label_3: # switch end
# }
 __label_2: # endif
.annotate 'line', 1026
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1027

.end # PredefBase


.sub 'name' :method
.annotate 'line', 1028
# Body
# {
.annotate 'line', 1030
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 1031
    .return($S1)
# }
.annotate 'line', 1032

.end # name


.sub 'result' :method
.annotate 'line', 1033
# Body
# {
.annotate 'line', 1035
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1036

.end # result


.sub 'params' :method
.annotate 'line', 1037
# Body
# {
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.annotate 'line', 1038
# Body
# {
.annotate 'line', 1040
# type: $S1
    null $S1
.annotate 'line', 1041
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
.annotate 'line', 1042
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 1043
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 1044
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 1045
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 1047
    'InternalError'('Invalid predef arg')
 __label_0: # switch end
.annotate 'line', 1049
    .return($S1)
# }
.annotate 'line', 1050

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 1051
# Body
# {
.annotate 'line', 1053
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1054
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1055
    isne $I1, $S1, 'v'
    unless $I1 goto __label_2
    iseq $I1, __ARG_4, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 1056
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
 __label_1: # endif
.annotate 'line', 1057
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1058
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1059

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 976
    addattribute $P0, 'name'
.annotate 'line', 977
    addattribute $P0, 'body'
.annotate 'line', 978
    addattribute $P0, 'typeresult'
.annotate 'line', 979
    addattribute $P0, 'type0'
.annotate 'line', 980
    addattribute $P0, 'type1'
.annotate 'line', 981
    addattribute $P0, 'type2'
.annotate 'line', 982
    addattribute $P0, 'type3'
.annotate 'line', 983
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
.annotate 'line', 1064
# Body
# {
.annotate 'line', 1071
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1072

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1062
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
.annotate 'line', 1078
# Body
# {
.annotate 'line', 1085
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1086
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1087

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1075
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1077
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
.annotate 'line', 1093
# Body
# {
.annotate 'line', 1095
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1096

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 1097
# Body
# {
.annotate 'line', 1099
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1100
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_1
.annotate 'line', 1101
    'InternalError'("Invalid Predef_typecast.invoke call")
 __label_1: # endif
.annotate 'line', 1102
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1103
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 1104
    iseq $I1, $S2, $S1
    if $I1 goto __label_5
    isa $I1, $P1, 'IndexExpr'
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 1105
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 1107
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 1108
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1110
    ne $S3, 'null', __label_7
.annotate 'line', 1111
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_8
 __label_7: # else
.annotate 'line', 1113
    __ARG_1.'emitset'(__ARG_3, $S3)
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 1115

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1092
    addattribute $P0, 'type'
.end
.namespace [ ]

.sub 'Predef_say'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.annotate 'line', 1118
# Body
# {
.annotate 'line', 1120
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1121
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1122
    lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1123
# i: $I2
    null $I2
 __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1124
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_2: # for iteration
.annotate 'line', 1123
    inc $I2
    goto __label_4
 __label_3: # for end
.annotate 'line', 1125
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 1128
    __ARG_1.'emitsay'("''")
 __label_1: # endif
# }
.annotate 'line', 1129

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.annotate 'line', 1131
# Body
# {
.annotate 'line', 1133
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1134
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1135
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1136
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1137
    $P1 = __ARG_4[$I2]
    __ARG_1.'say'('    ', "print $P0, ", $P1)
 __label_0: # for iteration
.annotate 'line', 1136
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1138
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1139

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.annotate 'line', 1141
# Body
# {
.annotate 'line', 1143
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1144
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1145
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1146
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_0: # for iteration
.annotate 'line', 1145
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 1147

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.annotate 'line', 1151
# Body
# {
.annotate 'line', 1153
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1154
    isa $I2, $P1, 'CallExpr'
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 1155
    'SyntaxError'("invoke argument must be callable", __ARG_2)
 __label_0: # endif
.annotate 'line', 1156
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1157

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1159
# Body
# {
.annotate 'line', 1161
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1162
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1163
# predefined length
    length $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1164

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1166
# Body
# {
.annotate 'line', 1168
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1169
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1170
# predefined bytelength
    bytelength $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1171

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1173
# Body
# {
.annotate 'line', 1175
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1176
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1177
# predefined ord
    ord $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1178

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1180
# Body
# {
.annotate 'line', 1182
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1183
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1184
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1185
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1186
# predefined ord
    ord $I2, $S1, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1187

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1189
# Body
# {
.annotate 'line', 1191
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1193
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1194
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1196
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1197
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1198

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1200
# Body
# {
.annotate 'line', 1202
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1203
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1204
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1205
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1207
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1208
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1209

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1211
# Body
# {
.annotate 'line', 1213
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1214
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1215
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1216
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 1217
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1218
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1220
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1221
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1222

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1224
# Body
# {
.annotate 'line', 1226
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1227
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1228
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1229
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 1230
# predefined indexof
    index $I1, $S1, $S2
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1231

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1233
# Body
# {
.annotate 'line', 1235
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1236
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1237
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1238
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1239
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 1240
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1241
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1242

.end # predefeval_indexof_pos


.sub 'getpredefs'
.annotate 'line', 1244
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
.annotate 'line', 1255
.const 'Sub' $P11 = 'Predef_print'
.annotate 'line', 1256
.const 'Sub' $P12 = 'Predef_say'
.annotate 'line', 1257
.const 'Sub' $P13 = 'Predef_cry'
.annotate 'line', 1258
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1260
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1261
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1262
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1260
    push $P1, $P16
.annotate 'line', 1265
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1266
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1260
    push $P1, $P20
.annotate 'line', 1269
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1270
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1260
    push $P1, $P24
.annotate 'line', 1273
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die {arg0}', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1260
    push $P1, $P28
.annotate 'line', 1277
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit {arg0}', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1260
    push $P1, $P30
.annotate 'line', 1281
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time {res}', 'I')
    set $P32, $P33
.annotate 'line', 1260
    push $P1, $P32
.annotate 'line', 1285
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time {res}', 'N')
    set $P34, $P35
.annotate 'line', 1260
    push $P1, $P34
.annotate 'line', 1289
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1260
    push $P1, $P36
.annotate 'line', 1293
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin {res}', 'P')
    set $P38, $P39
.annotate 'line', 1260
    push $P1, $P38
.annotate 'line', 1297
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout {res}', 'P')
    set $P40, $P41
.annotate 'line', 1260
    push $P1, $P40
.annotate 'line', 1301
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr {res}', 'P')
    set $P42, $P43
.annotate 'line', 1260
    push $P1, $P42
.annotate 'line', 1305
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1260
    push $P1, $P44
.annotate 'line', 1310
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1260
    push $P1, $P46
.annotate 'line', 1315
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1260
    push $P1, $P48
.annotate 'line', 1320
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1260
    push $P1, $P50
.annotate 'line', 1326
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1260
    push $P1, $P52
.annotate 'line', 1333
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements {res}, {arg0}', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1260
    push $P1, $P54
.annotate 'line', 1337
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1338
    $P57.'PredefFunctionEval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1260
    push $P1, $P56
.annotate 'line', 1342
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1343
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1260
    push $P1, $P58
.annotate 'line', 1347
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1348
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1260
    push $P1, $P60
.annotate 'line', 1354
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1355
    $P63.'PredefFunctionEval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1260
    push $P1, $P62
.annotate 'line', 1359
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1360
    $P65.'PredefFunctionEval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1260
    push $P1, $P64
.annotate 'line', 1364
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1365
    $P67.'PredefFunctionEval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1260
    push $P1, $P66
.annotate 'line', 1369
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1370
    $P69.'PredefFunctionEval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1260
    push $P1, $P68
.annotate 'line', 1374
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace {res}, {arg0}, {arg1}, {arg2}, {arg3}', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1260
    push $P1, $P70
.annotate 'line', 1378
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1379
    $P73.'PredefFunctionEval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1260
    push $P1, $P72
.annotate 'line', 1383
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1384
    $P75.'PredefFunctionEval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1260
    push $P1, $P74
.annotate 'line', 1388
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1260
    push $P1, $P76
.annotate 'line', 1392
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1260
    push $P1, $P78
.annotate 'line', 1396
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1260
    push $P1, $P80
.annotate 'line', 1400
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1260
    push $P1, $P82
.annotate 'line', 1404
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1260
    push $P1, $P84
.annotate 'line', 1408
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1260
    push $P1, $P86
.annotate 'line', 1413
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1260
    push $P1, $P88
.annotate 'line', 1418
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push {arg0}, {arg1}', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1260
    push $P1, $P90
.annotate 'line', 1422
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1260
    push $P1, $P92
.annotate 'line', 1426
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1260
    push $P1, $P94
.annotate 'line', 1430
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp {res}, {arg0}', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1260
    push $P1, $P96
.annotate 'line', 1434
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln {res}, {arg0}', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1260
    push $P1, $P98
.annotate 'line', 1438
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin {res}, {arg0}', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1260
    push $P1, $P100
.annotate 'line', 1442
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos {res}, {arg0}', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1260
    push $P1, $P102
.annotate 'line', 1446
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan {res}, {arg0}', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1260
    push $P1, $P104
.annotate 'line', 1450
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin {res}, {arg0}', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1260
    push $P1, $P106
.annotate 'line', 1454
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos {res}, {arg0}', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1260
    push $P1, $P108
.annotate 'line', 1458
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan {res}, {arg0}', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1260
    push $P1, $P110
.annotate 'line', 1462
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1260
    push $P1, $P112
.annotate 'line', 1466
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp {res}', 'P')
    set $P114, $P115
.annotate 'line', 1260
    push $P1, $P114
.annotate 'line', 1470
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1260
    push $P1, $P116
.annotate 'line', 1474
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof {res}, {arg0}', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1260
    push $P1, $P118
.annotate 'line', 1478
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1260
    push $P1, $P120
.annotate 'line', 1482
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1260
    push $P1, $P122
.annotate 'line', 1486
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1260
    push $P1, $P124
.annotate 'line', 1490
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone {res}, {arg0}', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1260
    push $P1, $P126
.annotate 'line', 1494
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1260
    push $P1, $P128
.annotate 'line', 1498
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1260
    push $P1, $P130
.annotate 'line', 1502
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1260
    push $P1, $P132
.annotate 'line', 1507
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1260
    push $P1, $P134
.annotate 'line', 1512
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1260
    push $P1, $P136
.annotate 'line', 1516
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1260
    push $P1, $P138
.annotate 'line', 1520
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1260
    push $P1, $P140
.annotate 'line', 1524
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1260
    push $P1, $P142
.annotate 'line', 1528
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1260
    push $P1, $P144
.annotate 'line', 1532
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1533
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1260
    push $P1, $P146
.annotate 'line', 1536
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1537
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1260
    push $P1, $P148
.annotate 'line', 1540
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1541
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1260
    push $P1, $P150
.annotate 'line', 1544
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1545
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1260
    push $P1, $P152
 __label_1: # Infinite loop
.annotate 'line', 1550
    .yield($P1)
    goto __label_1
 __label_0: # Infinite loop end
# }
.annotate 'line', 1551

.end # getpredefs


.sub 'findpredef'
        .param string __ARG_1
        .param int __ARG_2
.annotate 'line', 1553
# Body
# {
.annotate 'line', 1555
    $P2 = 'getpredefs'()
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1556
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1557
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1558
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_5
.annotate 'line', 1559
    iseq $I2, $I1, -1
 __label_5:
    if $I2 goto __label_4
.annotate 'line', 1560
    iseq $I2, $I1, -2
    unless $I2 goto __label_6
    iseq $I2, __ARG_2, 1
 __label_6:
 __label_4:
    unless $I2 goto __label_3
.annotate 'line', 1561
    .return($P1)
 __label_3: # endif
# }
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P2
.annotate 'line', 1563
    .return($P2)
# }
.annotate 'line', 1564

.end # findpredef


.sub 'optimize_array'
        .param pmc __ARG_1
.annotate 'line', 1570
# Body
# {
.annotate 'line', 1572
    if_null __ARG_1, __label_0
# {
.annotate 'line', 1573
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1574
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 1575
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
 __label_1: # for iteration
.annotate 'line', 1574
    inc $I2
    goto __label_3
 __label_2: # for end
# }
 __label_0: # endif
# }
.annotate 'line', 1577

.end # optimize_array


.sub 'parseDotted'
        .param pmc __ARG_1
.annotate 'line', 1579
# Body
# {
.annotate 'line', 1581
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1582
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1583
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 1584
# predefined push
    push $P1, $P2
 __label_2: # while
.annotate 'line', 1585
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1586
    $P2 = __ARG_1.'get'()
.annotate 'line', 1587
# predefined push
    push $P1, $P2
# }
    goto __label_2
 __label_1: # endwhile
# }
 __label_0: # endif
.annotate 'line', 1590
    __ARG_1.'unget'($P2)
.annotate 'line', 1591
    .return($P1)
# }
.annotate 'line', 1592

.end # parseDotted


.sub 'toIdentifierList'
        .param pmc __ARG_1
.annotate 'line', 1594
# Body
# {
.annotate 'line', 1596
    new $P1, ['ResizableStringArray']
.annotate 'line', 1597
    iter $P3, __ARG_1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 1598
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_0
 __label_1: # endfor
.annotate 'line', 1599
    .return($P1)
# }
.annotate 'line', 1600

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 1611
# Body
# {
.annotate 'line', 1613
    setattribute self, 'start', __ARG_1
.annotate 'line', 1614
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1615

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 1616
# Body
# {
.annotate 'line', 1618
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1619

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
.annotate 'line', 1620
# Body
# {
.annotate 'line', 1622
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1623

.end # use_predef


.sub 'generatesubid' :method
.annotate 'line', 1624
# Body
# {
.annotate 'line', 1626
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1627

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 1628
# Body
# {
.annotate 'line', 1630
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1631

.end # addlocalfunction


.sub 'findsymbol' :method
        .param pmc __ARG_1
.annotate 'line', 1632
# Body
# {
.annotate 'line', 1634
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1635

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
.annotate 'line', 1636
# Body
# {
.annotate 'line', 1638
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1639

.end # findclasskey


.sub 'dowarnings' :method
.annotate 'line', 1640
# Body
# {
.annotate 'line', 1642
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1643

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1608
    addattribute $P0, 'start'
.annotate 'line', 1609
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable
.annotate 'line', 1656
# Body
# {
.annotate 'line', 1658
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'args', $P2
# }
.annotate 'line', 1659

.end # init


.sub 'numargs' :method
.annotate 'line', 1661
# Body
# {
.annotate 'line', 1663
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1664

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 1665
# Body
# {
.annotate 'line', 1667
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1668
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1669

.end # getarg


.sub 'parseargs' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.annotate 'line', 1671
# Body
# {
.annotate 'line', 1673
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1674
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1675
# {
.annotate 'line', 1676
# var value: $P3
    $P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1677
# predefined push
    push $P1, $P3
# }
 __label_2: # continue
.annotate 'line', 1678
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1679
    'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1680

.end # parseargs


.sub 'optimizeargs' :method
.annotate 'line', 1682
# Body
# {
.annotate 'line', 1684
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
# }
.annotate 'line', 1685

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 1686
# Body
# {
.annotate 'line', 1688
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1689
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1690
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1691
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1692
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 1693
# reg: $S1
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1694
# predefined push
    push $P2, $S1
# }
 __label_0: # for iteration
.annotate 'line', 1691
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1696
    .return($P2)
# }
.annotate 'line', 1697

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 1698
# Body
# {
.annotate 'line', 1700
# var argreg: $P1
    $P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1701
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1702

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1654
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
.annotate 'line', 1714
# Body
# {
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
.annotate 'line', 1715
# Body
# {
.annotate 'line', 1717
# nargs: $I1
    getattribute $P2, self, 'args'
    $P1 = $P2.'numargs'()
    set $I1, $P1
.annotate 'line', 1718
    .return($I1)
# }
.annotate 'line', 1719

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 1720
# Body
# {
.annotate 'line', 1722
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1723
    $P2 = $P1.'numargs'()
    set $I1, $P2
    ge __ARG_1, $I1, __label_0
.annotate 'line', 1724
    .tailcall $P1.'getarg'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 1726
    'InternalError'('Wrong modifier arg number')
 __label_1: # endif
# }
.annotate 'line', 1727

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
.annotate 'line', 1728
# Body
# {
.annotate 'line', 1730
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1731
    if_null __ARG_2, __label_0
.annotate 'line', 1732
    setattribute self, 'args', __ARG_2
 __label_0: # endif
# }
.annotate 'line', 1733

.end # Modifier


.sub 'optimize' :method
.annotate 'line', 1734
# Body
# {
.annotate 'line', 1736
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
# }
.annotate 'line', 1737

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1711
    addattribute $P0, 'name'
.annotate 'line', 1712
    addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 1744
# Body
# {
.annotate 'line', 1746
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1747
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1748
# {
.annotate 'line', 1749
    $P2 = __ARG_1.'get'()
.annotate 'line', 1750
# name: $S1
    $P4 = $P2.'getidentifier'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1751
    $P2 = __ARG_1.'get'()
.annotate 'line', 1752
# var args: $P3
    new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1753
    $P4 = $P2.'isop'('(')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1754
    $P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1755
    $P2 = __ARG_1.'get'()
# }
 __label_4: # endif
.annotate 'line', 1757
    new $P5, [ 'Modifier' ]
    $P5.'Modifier'($S1, $P3)
    set $P4, $P5
# predefined push
    push $P1, $P4
# }
 __label_2: # continue
.annotate 'line', 1758
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1759
    'RequireOp'(']', $P2)
.annotate 'line', 1760
    setattribute self, 'list', $P1
# }
.annotate 'line', 1761

.end # ModifierList


.sub 'optimize' :method
.annotate 'line', 1762
# Body
# {
.annotate 'line', 1764
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1765
    $P1.'optimize'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 1766

.end # optimize


.sub 'getlist' :method
.annotate 'line', 1767
# Body
# {
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
.annotate 'line', 1768
# Body
# {
.annotate 'line', 1770
# var list: $P1
    getattribute $P1, self, 'list'
.annotate 'line', 1771
# n: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1772
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1773
# var mod: $P2
    $P2 = $P1[$I2]
.annotate 'line', 1774
    $P3 = $P2.'getname'()
    set $S1, $P3
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1775
    .return($P2)
# }
 __label_3: # endif
# }
 __label_0: # for iteration
.annotate 'line', 1772
    inc $I2
    goto __label_2
 __label_1: # for end
    null $P3
.annotate 'line', 1778
    .return($P3)
# }
.annotate 'line', 1779

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1742
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
        .param pmc __ARG_1
.annotate 'line', 1786
# Body
# {
.annotate 'line', 1788
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1789
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1790

.end # getparrotkey


.sub 'getparrotnamespacekey'
        .param pmc __ARG_1
.annotate 'line', 1792
# Body
# {
.annotate 'line', 1794
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_0
.annotate 'line', 1795
    .return(".namespace [ ]")
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 1797
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1798
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
 __label_1: # endif
# }
.annotate 'line', 1800

.end # getparrotnamespacekey


.sub 'parseUsing'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 1802
# Body
# {
.annotate 'line', 1804
# var taux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 1805
    $P2 = $P1.'iskeyword'('extern')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 1806
    new $P4, [ 'ExternStatement' ]
    $P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
    goto __label_1
 __label_0: # else
.annotate 'line', 1807
    $P5 = $P1.'iskeyword'('static')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 1808
    new $P7, [ 'StaticStatement' ]
    $P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 1810
    __ARG_2.'unget'($P1)
.annotate 'line', 1811
    new $P3, [ 'UsingStatement' ]
    $P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 1813

.end # parseUsing


.sub 'parseStatement'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 1815
# Body
# {
.annotate 'line', 1817
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1818
    $P3 = $P1.'isop'(';')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 1819
    new $P4, [ 'EmptyStatement' ]
    .return($P4)
 __label_0: # endif
.annotate 'line', 1820
    $P3 = $P1.'isop'('{')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1821
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_1: # endif
.annotate 'line', 1822
    $P3 = $P1.'isop'('${')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1823
    new $P5, [ 'PiropStatement' ]
    $P5.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_2: # endif
.annotate 'line', 1825
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
.annotate 'line', 1827
    .tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
 __label_6: # case
.annotate 'line', 1829
    .tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
    goto __label_3 # break
 __label_7: # case
.annotate 'line', 1832
    .tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
    goto __label_3 # break
 __label_8: # case
.annotate 'line', 1835
    .tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
 __label_9: # case
.annotate 'line', 1837
    .tailcall 'parseString'($P1, __ARG_1, __ARG_2)
 __label_10: # case
.annotate 'line', 1839
    .tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
 __label_11: # case
.annotate 'line', 1841
    .tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
 __label_12: # case
.annotate 'line', 1843
    new $P5, [ 'ReturnStatement' ]
    $P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_13: # case
.annotate 'line', 1845
    new $P7, [ 'YieldStatement' ]
    $P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
 __label_14: # case
.annotate 'line', 1847
    new $P9, [ 'GotoStatement' ]
    $P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P8, $P9
    .return($P8)
 __label_15: # case
.annotate 'line', 1849
    new $P11, [ 'IfStatement' ]
    $P11.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
 __label_16: # case
.annotate 'line', 1851
    new $P13, [ 'WhileStatement' ]
    $P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
 __label_17: # case
.annotate 'line', 1853
    new $P15, [ 'DoStatement' ]
    $P15.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
 __label_18: # case
.annotate 'line', 1855
    new $P17, [ 'ContinueStatement' ]
    $P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
 __label_19: # case
.annotate 'line', 1857
    new $P19, [ 'BreakStatement' ]
    $P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
 __label_20: # case
.annotate 'line', 1859
    new $P21, [ 'SwitchStatement' ]
    $P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
 __label_21: # case
.annotate 'line', 1861
    .tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
 __label_22: # case
.annotate 'line', 1863
    new $P23, [ 'ThrowStatement' ]
    $P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
 __label_23: # case
.annotate 'line', 1865
    new $P25, [ 'TryStatement' ]
    $P25.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
 __label_4: # default
.annotate 'line', 1867
    $P26 = $P1.'isidentifier'()
    if_null $P26, __label_24
    unless $P26 goto __label_24
# {
.annotate 'line', 1868
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1869
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_25
    unless $P3 goto __label_25
.annotate 'line', 1870
    new $P5, [ 'LabelStatement' ]
    $P5.'LabelStatement'($P1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_25: # endif
.annotate 'line', 1871
    __ARG_1.'unget'($P2)
# }
 __label_24: # endif
.annotate 'line', 1873
    __ARG_1.'unget'($P1)
.annotate 'line', 1874
    new $P4, [ 'ExprStatement' ]
    $P4.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P3, $P4
    .return($P3)
 __label_3: # switch end
.annotate 'line', 1876
    'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1877

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 1885
# Body
# {
.annotate 'line', 1887
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1888

.end # Statement


.sub 'isempty' :method
.annotate 'line', 1889
# Body
# {
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 1890
# Body
# {
.annotate 'line', 1892
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1893

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 1894
# Body
# {
.annotate 'line', 1896
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1897

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 1898
# Body
# {
.annotate 'line', 1900
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1901

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 1902
# Body
# {
.annotate 'line', 1904
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1905

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 1906
# Body
# {
.annotate 'line', 1908
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1909

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.annotate 'line', 1910
# Body
# {
.annotate 'line', 1912
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1913

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.annotate 'line', 1914
# Body
# {
.annotate 'line', 1916
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 1917

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 1918
# Body
# {
.annotate 'line', 1920
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1921

.end # createvar


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 1922
# Body
# {
.annotate 'line', 1924
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1925

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 1926
# Body
# {
.annotate 'line', 1928
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1929

.end # checkclass


.sub 'getouter' :method
.annotate 'line', 1931
# Body
# {
.annotate 'line', 1936
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 1937

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.annotate 'line', 1938
# Body
# {
.annotate 'line', 1940
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1941

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.annotate 'line', 1942
# Body
# {
.annotate 'line', 1944
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1945

.end # getbreaklabel


.sub 'optimize' :method
.annotate 'line', 1946
# Body
# {
.annotate 'line', 1948
    getattribute $P1, self, 'start'
    'InternalError'('**checking**', $P1)
.annotate 'line', 1950
    .return(self)
# }
.annotate 'line', 1951

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1883
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
.annotate 'line', 1956
# Body
# {
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 1957
# Body
# {
.annotate 'line', 1959
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1960

.end # annotate


.sub 'optimize' :method
.annotate 'line', 1961
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 1962
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1954
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
.annotate 'line', 1972
# Body
# {
.annotate 'line', 1974
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 1975
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 1976
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 1977
# i: $I3
    null $I3
 __label_2: # for condition
    ge $I3, $I1, __label_1
# {
.annotate 'line', 1978
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 1979
    set $I4, $I2
    unless $I4 goto __label_4
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
 __label_4:
    unless $I4 goto __label_3
.annotate 'line', 1980
    null $I2
 __label_3: # endif
.annotate 'line', 1981
    $P1[$I3] = $P2
# }
 __label_0: # for iteration
.annotate 'line', 1977
    inc $I3
    goto __label_2
 __label_1: # for end
.annotate 'line', 1983
    unless $I2 goto __label_5
.annotate 'line', 1984
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_6
 __label_5: # else
.annotate 'line', 1986
    .return(self)
 __label_6: # endif
# }
.annotate 'line', 1987

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 1970
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 1992
# Body
# {
.annotate 'line', 1994
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 1995
    setattribute self, 'statements', $P1
# }
.annotate 'line', 1996

.end # MultiStatement


.sub 'isempty' :method
.annotate 'line', 1997
# Body
# {
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
.annotate 'line', 1998
# Body
# {
.annotate 'line', 2000
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2001
    .return(self)
# }
.annotate 'line', 2002

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2003
# Body
# {
.annotate 'line', 2005
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 2006
    $P1.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 2007

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 1990
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2010
# Body
# {
.annotate 'line', 2012
    unless_null __ARG_1, __label_0
.annotate 'line', 2013
    .return(__ARG_2)
    goto __label_1
 __label_0: # else
.annotate 'line', 2014
    isa $I1, __ARG_1, 'MultiStatement'
    unless $I1 goto __label_2
.annotate 'line', 2015
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_3
 __label_2: # else
.annotate 'line', 2017
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 2018

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2029
# Body
# {
.annotate 'line', 2031
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2032
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2033
# dotted: $I1
    null $I1
.annotate 'line', 2034
    $P4 = $P1.'isop'('.')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 2035
    set $I1, 1
.annotate 'line', 2036
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 2038
# opname: $S1
    $P4 = $P1.'getidentifier'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
 __label_1:
.annotate 'line', 2039
    unless $I1 goto __label_3
    set $S3, '.'
    goto __label_2
 __label_3:
    set $S3, ''
 __label_2:
    concat $S4, $S3, $S1
    box $P4, $S4
    setattribute self, 'opname', $P4
.annotate 'line', 2040
    $P1 = __ARG_2.'get'()
.annotate 'line', 2041
    $P4 = $P1.'isop'('}')
    isfalse $I2, $P4
    unless $I2 goto __label_4
# {
.annotate 'line', 2042
    __ARG_2.'unget'($P1)
.annotate 'line', 2043
# var args: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_5: # do
.annotate 'line', 2044
# {
.annotate 'line', 2045
# var arg: $P3
    null $P3
.annotate 'line', 2046
    $P1 = __ARG_2.'get'()
.annotate 'line', 2047
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_8
    unless $P4 goto __label_8
# {
.annotate 'line', 2048
    $P1 = __ARG_2.'get'()
.annotate 'line', 2049
# label: $S2
    $P4 = $P1.'getidentifier'()
    null $S2
    if_null $P4, __label_10
    set $S2, $P4
 __label_10:
.annotate 'line', 2050
    new $P4, [ 'Reflabel' ]
    $P4.'Reflabel'(__ARG_3, $S2)
    set $P3, $P4
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 2053
    __ARG_2.'unget'($P1)
.annotate 'line', 2054
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
 __label_9: # endif
.annotate 'line', 2056
# predefined push
    push $P2, $P3
# }
 __label_7: # continue
.annotate 'line', 2057
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 2058
    'RequireOp'('}', $P1)
.annotate 'line', 2059
    setattribute self, 'args', $P2
# }
 __label_4: # endif
.annotate 'line', 2061
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2062

.end # PiropStatement


.sub 'optimize' :method
.annotate 'line', 2063
# Body
# {
.annotate 'line', 2065
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 2066
    .return(self)
# }
.annotate 'line', 2067

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2068
# Body
# {
.annotate 'line', 2070
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2071
    self.'annotate'(__ARG_1)
.annotate 'line', 2072
    concat $S3, 'pirop ', $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 2073
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2074
    __ARG_1.'print'('    ')
.annotate 'line', 2075
    unless_null $P1, __label_1
.annotate 'line', 2076
    __ARG_1.'say'($S1)
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2078
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2079
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 2080
# i: $I2
    null $I2
 __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 2081
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 2082
# reg: $S2
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
 __label_6:
.annotate 'line', 2083
# predefined push
    push $P2, $S2
# }
 __label_3: # for iteration
.annotate 'line', 2080
    inc $I2
    goto __label_5
 __label_4: # for end
.annotate 'line', 2085
# predefined join
    join $S3, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S3)
# }
 __label_2: # endif
# }
.annotate 'line', 2087

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2024
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2026
    addattribute $P0, 'opname'
.annotate 'line', 2027
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2097
# Body
# {
.annotate 'line', 2099
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2100
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2101
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2102
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2103
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2104
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2105
    .return(self)
# }
.annotate 'line', 2106

.end # ExternStatement


.sub 'optimize' :method
.annotate 'line', 2107
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2108
# Body
# {
.annotate 'line', 2110
    self.'annotate'(__ARG_1)
.annotate 'line', 2111
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2112

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2094
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2096
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2122
# Body
# {
.annotate 'line', 2124
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2125
# sym: $S1
    $P1 = __ARG_2.'get'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2126
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2127
    box $P1, $S1
    setattribute self, 'symbol', $P1
# }
.annotate 'line', 2128

.end # StaticStatement


.sub 'optimize' :method
.annotate 'line', 2129
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2130
# Body
# {
.annotate 'line', 2132
    self.'annotate'(__ARG_1)
.annotate 'line', 2133
# var v: $P1
    getattribute $P2, self, 'symbol'
    $P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2134
    $P2 = $P1.'getreg'()
    getattribute $P3, self, 'symbol'
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2135

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2119
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2121
    addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2147
# Body
# {
.annotate 'line', 2149
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2150
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2151
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2152
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2153
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2154
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
# }
.annotate 'line', 2155

.end # UsingStatement


.sub 'optimize' :method
.annotate 'line', 2156
# Body
# {
.annotate 'line', 2158
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2159
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2160
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2162
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
.annotate 'line', 2163
    if_null $P3, __label_0
# {
.annotate 'line', 2164
    isa $I1, $P3, 'FunctionStatement'
    unless $I1 goto __label_1
# {
.annotate 'line', 2165
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2166
    box $P4, $S2
    setattribute self, 'subid', $P4
# }
 __label_1: # endif
# }
 __label_0: # endif
.annotate 'line', 2169
    .return(self)
# }
.annotate 'line', 2170

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2171
# Body
# {
.annotate 'line', 2173
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2174
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2175
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2176
    getattribute $P3, self, 'subid'
    if_null $P3, __label_0
# {
.annotate 'line', 2177
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2178
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2181
    self.'annotate'(__ARG_1)
.annotate 'line', 2182
    $P3 = $P2.'getreg'()
    __ARG_1.'print'("    get_hll_global ", $P3, ', ')
.annotate 'line', 2183
    $P1.'pop'()
.annotate 'line', 2184
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 2186
    __ARG_1.'say'("'", $S1, "'")
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 2189
    $P3 = 'getparrotkey'($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
 __label_3: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2192

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2142
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2144
    addattribute $P0, 'path'
.annotate 'line', 2145
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2202
# Body
# {
.annotate 'line', 2204
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2205
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2206
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2207

.end # ExprStatement


.sub 'optimize' :method
.annotate 'line', 2208
# Body
# {
.annotate 'line', 2210
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2211
    .return(self)
# }
.annotate 'line', 2212

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 2213
# Body
# {
.annotate 'line', 2215
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2216

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2199
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2201
    addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param pmc __ARG_5 :optional
.annotate 'line', 2233
# Body
# {
.annotate 'line', 2235
    setattribute self, 'type', __ARG_1
.annotate 'line', 2236
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2237
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2238
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2239
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2240

.end # VarData


.sub 'setid' :method
        .param string __ARG_1
.annotate 'line', 2241
# Body
# {
.annotate 'line', 2243
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2244

.end # setid


.sub 'setlex' :method
        .param string __ARG_1
.annotate 'line', 2245
# Body
# {
.annotate 'line', 2247
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2248

.end # setlex


.sub 'gettype' :method
.annotate 'line', 2249
# Body
# {
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
.annotate 'line', 2250
# Body
# {
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
.annotate 'line', 2251
# Body
# {
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
.annotate 'line', 2252
# Body
# {
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
.annotate 'line', 2253
# Body
# {
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
.annotate 'line', 2254
# Body
# {
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
.annotate 'line', 2255
# Body
# {
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
.annotate 'line', 2256
# Body
# {
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2225
    addattribute $P0, 'type'
.annotate 'line', 2226
    addattribute $P0, 'reg'
.annotate 'line', 2227
    addattribute $P0, 'scope'
.annotate 'line', 2228
    addattribute $P0, 'flags'
.annotate 'line', 2229
    addattribute $P0, 'value'
.annotate 'line', 2230
    addattribute $P0, 'id'
.annotate 'line', 2231
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
.annotate 'line', 2262
# Body
# {
.annotate 'line', 2264
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2265

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.annotate 'line', 2266
# Body
# {
.annotate 'line', 2268
    'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2269

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2261
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
.annotate 'line', 2276
# Body
# {
.annotate 'line', 2278
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2279

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 2280
# Body
# {
.annotate 'line', 2282
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2283
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2284
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2285
    if_null $P2, __label_1
.annotate 'line', 2286
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    'SyntaxError'($S3, __ARG_1)
 __label_1: # endif
.annotate 'line', 2287
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2288
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2289
    $P1[$S1] = $P3
.annotate 'line', 2290
    .return($P3)
# }
.annotate 'line', 2291

.end # createvar


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 2292
# Body
# {
.annotate 'line', 2294
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2295
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2296
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2297
    if_null $P2, __label_1
.annotate 'line', 2298
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2299
    new $P4, [ 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2300

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.annotate 'line', 2301
# Body
# {
.annotate 'line', 2303
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2304
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2305
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2306
    if_null $P2, __label_1
.annotate 'line', 2307
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2308
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P5, [ 'ConstantInternalFail' ]
    $P5.'ConstantInternalFail'(__ARG_1)
    set $P4, $P5
    $P3.'VarData'(__ARG_2, $P4, self, 0, __ARG_3)
.annotate 'line', 2309
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_3
    isne $I1, __ARG_4, ''
 __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2310
    $P3.'setid'(__ARG_4)
 __label_2: # endif
.annotate 'line', 2311
    $P1[$S1] = $P3
# }
.annotate 'line', 2312

.end # createconst


.sub 'getvar' :method
        .param pmc __ARG_1
.annotate 'line', 2313
# Body
# {
.annotate 'line', 2315
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2316
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2317
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2318
    isnull $I1, $P2
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 2319
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
 __label_1: # endif
.annotate 'line', 2320
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    isa $I2, $P2, 'VarData'
    not $I1, $I2
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2321
    'InternalError'('Incorrect data for Variable', __ARG_1)
 __label_3: # endif
.annotate 'line', 2322
    .return($P2)
# }
.annotate 'line', 2323

.end # getvar


.sub 'getlocalvar' :method
        .param pmc __ARG_1
.annotate 'line', 2324
# Body
# {
.annotate 'line', 2326
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2327
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2328
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2329
    .return($P2)
# }
.annotate 'line', 2330

.end # getlocalvar


.sub 'makelexical' :method
        .param pmc __ARG_1
.annotate 'line', 2331
# Body
# {
.annotate 'line', 2333
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2334
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2335
    .return($S1)
# }
.annotate 'line', 2336

.end # makelexical


.sub 'makelexicalself' :method
.annotate 'line', 2337
# Body
# {
.annotate 'line', 2339
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2341
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2342
    .return('__WLEX_self')
# }
.annotate 'line', 2343

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2275
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2352
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2362
# Body
# {
.annotate 'line', 2364
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2365

.end # Expr


.sub 'issimple' :method
.annotate 'line', 2366
# Body
# {
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
.annotate 'line', 2367
# Body
# {
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
.annotate 'line', 2368
# Body
# {
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
.annotate 'line', 2369
# Body
# {
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
.annotate 'line', 2370
# Body
# {
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
.annotate 'line', 2371
# Body
# {
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
.annotate 'line', 2372
# Body
# {
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
.annotate 'line', 2373
# Body
# {
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
.annotate 'line', 2374
# Body
# {
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
.annotate 'line', 2375
# Body
# {
.annotate 'line', 2377
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2378

.end # tempreg


.sub 'optimize' :method
.annotate 'line', 2379
# Body
# {
.annotate 'line', 2382
    .return(self)
# }
.annotate 'line', 2383

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 2384
# Body
# {
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 2385
# Body
# {
.annotate 'line', 2387
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2388
# reg: $S2
    ne $S1, 'v', __label_2
    set $S2, ''
    goto __label_1
 __label_2:
    $S2 = self.'tempreg'($S1)
 __label_1:
.annotate 'line', 2389
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2390
    .return($S2)
# }
.annotate 'line', 2391

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
.annotate 'line', 2392
# Body
# {
.annotate 'line', 2394
# reg: $S1
    null $S1
.annotate 'line', 2395
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_0
.annotate 'line', 2396
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2398
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2399
    self.'emit'(__ARG_1, $S1)
# }
 __label_1: # endif
.annotate 'line', 2401
    .return($S1)
# }
.annotate 'line', 2402

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2403
# Body
# {
.annotate 'line', 2405
    getattribute $P1, self, 'start'
    'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2406

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2360
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
.annotate 'line', 2411
# Body
# {
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2409
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2419
# Body
# {
.annotate 'line', 2421
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2422
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2423
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 2424
    'SyntaxError'('anonymous function expected', $P1)
 __label_0: # endif
.annotate 'line', 2425
    new $P4, [ 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2426

.end # FunctionExpr


.sub 'checkresult' :method
.annotate 'line', 2427
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 2428
# Body
# {
.annotate 'line', 2430
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2431
    .return(self)
# }
.annotate 'line', 2432

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2433
# Body
# {
.annotate 'line', 2435
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2436
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2437
    self.'annotate'(__ARG_1)
.annotate 'line', 2438
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2439
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 2440
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 2441

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2416
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2418
    addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
.annotate 'line', 2454
# Body
# {
.annotate 'line', 2456
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2457
    .return(self)
# }
.annotate 'line', 2458

.end # set


.sub 'optimize_condition' :method
.annotate 'line', 2459
# Body
# {
.annotate 'line', 2461
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2462

.end # optimize_condition


.sub 'optimize' :method
.annotate 'line', 2463
# Body
# {
.annotate 'line', 2465
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2466
    .return(self)
# }
.annotate 'line', 2467

.end # optimize


.sub 'getvalue' :method
.annotate 'line', 2468
# Body
# {
.annotate 'line', 2470
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2471
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 2472
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 2474
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2475
    ne $I1, 0, __label_4
.annotate 'line', 2476
    .return(2)
    goto __label_5
 __label_4: # else
.annotate 'line', 2478
    .return(1)
 __label_5: # endif
 __label_2: # default
 __label_1: # switch end
# }
 __label_0: # endif
.annotate 'line', 2481
    .return(0)
# }
.annotate 'line', 2482

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 2483
# Body
# {
.annotate 'line', 2485
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2487
    isa $I1, $P1, 'ComparatorBaseExpr'
    if $I1 goto __label_2
.annotate 'line', 2488
    isa $I1, $P1, 'NullCheckerExpr'
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2489
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2491
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2492
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2493
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
.annotate 'line', 2496
    __ARG_1.'emitif_null'($S1, __ARG_3)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2499
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2502
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2505

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 2506
# Body
# {
.annotate 'line', 2508
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2510
    isa $I1, $P1, 'ComparatorBaseExpr'
    if $I1 goto __label_2
.annotate 'line', 2511
    isa $I1, $P1, 'NullCheckerExpr'
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2512
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2514
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2515
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2516
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
.annotate 'line', 2519
    __ARG_1.'emitif_null'($S1, __ARG_2)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2522
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2525
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2528

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2453
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
.annotate 'line', 2535
# Body
# {
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
.annotate 'line', 2536
# Body
# {
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2533
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2544
# Body
# {
.annotate 'line', 2546
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2547
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2548

.end # StringLiteral


.sub 'isstringliteral' :method
.annotate 'line', 2549
# Body
# {
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
.annotate 'line', 2550
# Body
# {
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
.annotate 'line', 2551
# Body
# {
.annotate 'line', 2553
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2554
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2555
# typesinglequoted: $I1
    isa $I1, $P1, 'TokenSingleQuoted'
.annotate 'line', 2556
# need_unicode: $I2
    null $I2
.annotate 'line', 2557
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $I3, $P3
# {
.annotate 'line', 2558
    le $I3, 127, __label_3
# {
.annotate 'line', 2559
    set $I2, 1
    goto __label_2 # break
.annotate 'line', 2560
# }
 __label_3: # endif
# }
    goto __label_1
 __label_2: # endfor
.annotate 'line', 2563
    unless $I2 goto __label_4
# {
.annotate 'line', 2564
    unless $I1 goto __label_5
# {
.annotate 'line', 2565
    null $I1
.annotate 'line', 2566
# saux: $S2
    set $S2, $S1
.annotate 'line', 2567
    set $S1, ''
.annotate 'line', 2568
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
 __label_6: # for iteration
    unless $P4 goto __label_7
    shift $S3, $P4
# {
.annotate 'line', 2569
    ne $S3, '\', __label_8
.annotate 'line', 2570
    set $S3, '\\'
 __label_8: # endif
.annotate 'line', 2571
    concat $S1, $S1, $S3
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 2574
# result: $S4
    set $S4, ''
.annotate 'line', 2575
# l: $I4
# predefined length
    length $I4, $S1
# for loop
.annotate 'line', 2576
# i: $I5
    null $I5
 __label_11: # for condition
    ge $I5, $I4, __label_10
# {
.annotate 'line', 2577
# c: $S5
# predefined substr
    substr $S5, $S1, $I5, 1
.annotate 'line', 2578
# n: $I6
# predefined ord
    ord $I6, $S5
.annotate 'line', 2579
    le $I6, 127, __label_12
# {
.annotate 'line', 2580
# h: $S6
    box $P5, $I6
    $P2 = $P5.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
 __label_14:
.annotate 'line', 2581
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 2584
    concat $S4, $S4, $S5
 __label_13: # endif
# }
 __label_9: # for iteration
.annotate 'line', 2576
    inc $I5
    goto __label_11
 __label_10: # for end
.annotate 'line', 2586
    set $S1, $S4
# }
 __label_4: # endif
.annotate 'line', 2588
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
 __label_16:
    set $S7, '"'
 __label_15:
.annotate 'line', 2589
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2590
    unless $I2 goto __label_17
.annotate 'line', 2591
    concat $S0, 'unicode:', $S1
    set $S1, $S0
 __label_17: # endif
.annotate 'line', 2592
    .return($S1)
# }
.annotate 'line', 2593

.end # getPirString


.sub 'get_value' :method
.annotate 'line', 2594
# Body
# {
.annotate 'line', 2596
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2597
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2598
    isa $I1, $P1, 'TokenQuoted'
    unless $I1 goto __label_1
# {
.annotate 'line', 2599
# var s: $P2
    box $P2, $S1
.annotate 'line', 2600
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
 __label_1: # endif
.annotate 'line', 2602
    .return($S1)
# }
.annotate 'line', 2603

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2604
# Body
# {
.annotate 'line', 2606
    set $S1, __ARG_2
    eq $S1, '', __label_0
.annotate 'line', 2607
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
 __label_0: # endif
# }
.annotate 'line', 2608

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 2609
# Body
# {
.annotate 'line', 2611
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2612

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2541
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2543
    addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param int __ARG_4 :opt_flag
.annotate 'line', 2621
# Body
# {
.annotate 'line', 2624
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2625
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2626
# n: $I1
    null $I1
.annotate 'line', 2627
    unless __ARG_4 goto __label_0
.annotate 'line', 2628
    set $I1, __ARG_3
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2630
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 2631
    set $I1, $S1
# }
 __label_1: # endif
.annotate 'line', 2633
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2634

.end # IntegerLiteral


.sub 'isintegerliteral' :method
.annotate 'line', 2635
# Body
# {
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
.annotate 'line', 2636
# Body
# {
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
.annotate 'line', 2637
# Body
# {
.annotate 'line', 2639
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2640
# i: $I1
    set $S2, $S1
    set $I1, $S2
.annotate 'line', 2641
    .return($I1)
# }
.annotate 'line', 2642

.end # getIntegerValue


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
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2647
    ne $I1, 0, __label_1
.annotate 'line', 2648
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
 __label_1: # else
.annotate 'line', 2650
    __ARG_1.'emitset'(__ARG_2, $I1)
 __label_2: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 2652

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 2653
# Body
# {
.annotate 'line', 2655
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2656

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2617
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2619
    addattribute $P0, 'pos'
.annotate 'line', 2620
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2664
# Body
# {
.annotate 'line', 2666
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2667
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2668

.end # FloatLiteral


.sub 'isfloatliteral' :method
.annotate 'line', 2669
# Body
# {
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
.annotate 'line', 2670
# Body
# {
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
.annotate 'line', 2671
# Body
# {
.annotate 'line', 2673
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2674
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2675
    assign $P1, $S1
.annotate 'line', 2676
    .return($P1)
# }
.annotate 'line', 2677

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2678
# Body
# {
.annotate 'line', 2680
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2681
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2682
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
 __label_0: # endif
# }
.annotate 'line', 2684

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 2685
# Body
# {
.annotate 'line', 2689
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2690
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 2691
    concat $S1, $S1, '.0'
 __label_1: # endif
.annotate 'line', 2692
    .return($S1)
# }
.annotate 'line', 2693

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2661
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2663
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
.annotate 'line', 2701
# Body
# {
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2702
# Body
# {
.annotate 'line', 2704
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2705
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2706

.end # IdentifierExpr


.sub 'isnull' :method
.annotate 'line', 2707
# Body
# {
.annotate 'line', 2709
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2710

.end # isnull


.sub 'checkresult' :method
.annotate 'line', 2711
# Body
# {
.annotate 'line', 2713
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2714
    if_null $P1, __label_0
.annotate 'line', 2715
    .tailcall $P1.'gettype'()
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2717
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
.annotate 'line', 2720
    .return('P')
 __label_3: # default
.annotate 'line', 2722
    .return('')
 __label_2: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2725

.end # checkresult


.sub 'getName' :method
.annotate 'line', 2726
# Body
# {
.annotate 'line', 2728
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2729
    .return($S1)
# }
.annotate 'line', 2730

.end # getName


.sub 'checkIdentifier' :method
.annotate 'line', 2731
# Body
# {
.annotate 'line', 2733
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2734
    unless_null $P1, __label_0
.annotate 'line', 2735
    'InternalError'('Bad thing')
 __label_0: # endif
.annotate 'line', 2736
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2737
# s: $S1
    null $S1
.annotate 'line', 2738
    unless_null $P2, __label_1
# {
.annotate 'line', 2739
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
 __label_3:
.annotate 'line', 2740
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_6
    set $S4, 'null'
    if $S3 == $S4 goto __label_7
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 2742
    set $S1, 'self'
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 2744
    set $S1, 'null'
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 2746
    set $S1, ''
 __label_4: # switch end
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2750
    $P3 = $P2.'getid'()
    if_null $P3, __label_8
.annotate 'line', 2751
    .tailcall $P2.'getid'()
    goto __label_9
 __label_8: # else
.annotate 'line', 2753
    $P4 = $P2.'getreg'()
    set $S1, $P4
 __label_9: # endif
# }
 __label_2: # endif
.annotate 'line', 2755
    .return($S1)
# }
.annotate 'line', 2756

.end # checkIdentifier


.sub 'getIdentifier' :method
.annotate 'line', 2757
# Body
# {
.annotate 'line', 2759
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2760
    set $S2, $P1
    ne $S2, '', __label_0
# {
.annotate 'line', 2761
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
 __label_1:
.annotate 'line', 2762
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    'SyntaxError'($S2, $P2)
# }
 __label_0: # endif
.annotate 'line', 2764
    .return($P1)
# }
.annotate 'line', 2765

.end # getIdentifier


.sub 'optimize' :method
.annotate 'line', 2766
# Body
# {
.annotate 'line', 2768
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2769
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2770
    if_null $P2, __label_0
# {
.annotate 'line', 2771
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_2
    $P3 = $P2.'getid'()
    isnull $I2, $P3
 __label_2:
    unless $I2 goto __label_1
.annotate 'line', 2772
    .tailcall $P2.'getvalue'()
 __label_1: # endif
.annotate 'line', 2773
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2774
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2775
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2776
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
 __label_4: # endif
# }
 __label_3: # endif
# }
 __label_0: # endif
.annotate 'line', 2779
    .return(self)
# }
.annotate 'line', 2780

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
.annotate 'line', 2781
# Body
# {
.annotate 'line', 2783
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2784
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2785
# flags: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
 __label_2:
    $I1 = $P1.'getflags'()
 __label_1:
.annotate 'line', 2786
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2787
    band $I3, $I1, 2
    unless $I3 goto __label_4
# {
.annotate 'line', 2788
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
 __label_5:
.annotate 'line', 2789
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
 __label_7:
    unless $I2 goto __label_6
.annotate 'line', 2790
    __ARG_1.'emitfind_lex'($S1, $S2)
 __label_6: # endif
# }
 __label_4: # endif
# }
 __label_3: # endif
.annotate 'line', 2793
    .return($S1)
# }
.annotate 'line', 2794

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2795
# Body
# {
.annotate 'line', 2797
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2798
    self.'annotate'(__ARG_1)
.annotate 'line', 2799
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2800
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2802

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 2803
# Body
# {
.annotate 'line', 2805
    self.'annotate'(__ARG_1)
.annotate 'line', 2806
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2807
    .return($S1)
# }
.annotate 'line', 2808

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2809
# Body
# {
.annotate 'line', 2811
    self.'annotate'(__ARG_1)
.annotate 'line', 2812
    $P1 = self.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# predefined die
.annotate 'line', 2813
    die "NO"
 __label_0: # endif
.annotate 'line', 2814
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2815
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 2816
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
# {
.annotate 'line', 2817
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_7
    set $S6, 'P'
    if $S5 == $S6 goto __label_8
    goto __label_6
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2820
    __ARG_1.'emitnull'($S2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2823
    getattribute $P2, self, 'start'
    'SyntaxError'("Can't assign null to that type", $P2)
 __label_5: # switch end
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 2826
    isa $I1, __ARG_2, 'IndexExpr'
    unless $I1 goto __label_9
.annotate 'line', 2827
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 2829
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_11
    set $S3, $P1
 __label_11:
.annotate 'line', 2830
    ne $S3, 'v', __label_12
.annotate 'line', 2831
    getattribute $P1, self, 'start'
    'SyntaxError'("Can't assign from void expression", $P1)
 __label_12: # endif
.annotate 'line', 2832
    ne $S1, $S3, __label_13
# {
.annotate 'line', 2833
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 2836
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_15
    set $S4, $P1
 __label_15:
.annotate 'line', 2837
    self.'annotate'(__ARG_1)
.annotate 'line', 2838
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_18
    isne $I1, $S3, 'P'
 __label_18:
    unless $I1 goto __label_16
.annotate 'line', 2839
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_17
 __label_16: # else
.annotate 'line', 2841
    __ARG_1.'emitset'($S2, $S4)
 __label_17: # endif
# }
 __label_14: # endif
# }
 __label_10: # endif
 __label_4: # endif
.annotate 'line', 2844
    .return($S2)
# }
.annotate 'line', 2845

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2698
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2700
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2853
# Body
# {
.annotate 'line', 2855
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2856
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2857

.end # LexicalVolatileExpr


.sub 'checkresult' :method
.annotate 'line', 2858
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 2859
# Body
# {
.annotate 'line', 2861
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2862
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2863
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 2864
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 2865
    .return($S2)
# }
.annotate 'line', 2866

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2867
# Body
# {
.annotate 'line', 2869
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2870
    self.'annotate'(__ARG_1)
.annotate 'line', 2871
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2872
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2874

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2875
# Body
# {
.annotate 'line', 2877
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2878
    $P2 = __ARG_2.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2879
    __ARG_1.'emitnull'($S1)
    goto __label_2
 __label_1: # else
.annotate 'line', 2880
    isa $I1, __ARG_2, 'IndexExpr'
    unless $I1 goto __label_3
.annotate 'line', 2881
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 2883
# typeright: $S2
    $P3 = __ARG_2.'checkresult'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 2884
    ne 'P', $S2, __label_6
# {
.annotate 'line', 2885
    __ARG_2.'emit'(__ARG_1, $S1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 2888
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
 __label_8:
.annotate 'line', 2889
    self.'annotate'(__ARG_1)
.annotate 'line', 2890
    __ARG_1.'emitbox'($S1, $S3)
# }
 __label_7: # endif
# }
 __label_4: # endif
 __label_2: # endif
.annotate 'line', 2894
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2895
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 2896
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2897

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2850
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2852
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2904
# Body
# {
.annotate 'line', 2906
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2907

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2902
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2916
# Body
# {
.annotate 'line', 2918
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2919
    $P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2920

.end # OpClassExpr


.sub 'checkresult' :method
.annotate 'line', 2921
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 2922
# Body
# {
.annotate 'line', 2924
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 2927
    set $S1, __ARG_2
    ne $S1, '', __label_0
.annotate 'line', 2928
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
 __label_0: # endif
.annotate 'line', 2929
    __ARG_1.'print'("    get_class ", __ARG_2, ', ')
.annotate 'line', 2930
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2931
    __ARG_1.'say'()
# }
.annotate 'line', 2932

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2912
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2914
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 2940
# Body
# {
.annotate 'line', 2942
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2943
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2944

.end # OpUnaryExpr


.sub 'optimizearg' :method
.annotate 'line', 2945
# Body
# {
.annotate 'line', 2947
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2948

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 2949
# Body
# {
.annotate 'line', 2951
    self.'optimizearg'()
.annotate 'line', 2952
    .return(self)
# }
.annotate 'line', 2953

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2937
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2939
    addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 2962
# Body
# {
.annotate 'line', 2964
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2965
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 2966
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 2967

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 2968
# Body
# {
.annotate 'line', 2970
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 2971
    .return(self)
# }
.annotate 'line', 2972

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
.annotate 'line', 2973
# Body
# {
.annotate 'line', 2975
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 2976

.end # setfrom


.sub 'optimizearg' :method
.annotate 'line', 2977
# Body
# {
.annotate 'line', 2979
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 2980
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 2981

.end # optimizearg


.sub 'optimize' :method
.annotate 'line', 2982
# Body
# {
.annotate 'line', 2984
    self.'optimizearg'()
.annotate 'line', 2985
    .return(self)
# }
.annotate 'line', 2986

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
.annotate 'line', 2987
# Body
# {
.annotate 'line', 2989
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2990
    .return($S1)
# }
.annotate 'line', 2991

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
.annotate 'line', 2992
# Body
# {
.annotate 'line', 2994
# reg: $S1
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2995
    .return($S1)
# }
.annotate 'line', 2996

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2958
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2960
    addattribute $P0, 'lexpr'
.annotate 'line', 2961
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3003
# Body
# {
.annotate 'line', 3005
    .return('I')
# }
.annotate 'line', 3006

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 3007
# Body
# {
.annotate 'line', 3009
    self.'optimizearg'()
.annotate 'line', 3010
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3011
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3012
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3013
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3014
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3015
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3017
    .return(self)
# }
.annotate 'line', 3018

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3001
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
.annotate 'line', 3025
# Body
# {
.annotate 'line', 3027
    .return('I')
# }
.annotate 'line', 3028

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3029
# Body
# {
.annotate 'line', 3031
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3032
    .return(self)
# }
.annotate 'line', 3033

.end # set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3023
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3039
# Body
# {
.annotate 'line', 3041
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3042
    isa $I1, $P1, 'IndexExpr'
    unless $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 3043
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3044
    self.'annotate'(__ARG_1)
.annotate 'line', 3045
    __ARG_1.'print'("    delete ")
.annotate 'line', 3046
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3047
    __ARG_1.'say'()
.annotate 'line', 3048
    set $S1, __ARG_2
    eq $S1, '', __label_3
.annotate 'line', 3049
    __ARG_1.'emitset'(__ARG_2, '1')
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 3052
    getattribute $P2, self, 'start'
    'SyntaxError'("delete with invalid operator", $P2)
 __label_1: # endif
# }
.annotate 'line', 3053

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3037
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpExistsExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3058
# Body
# {
.annotate 'line', 3060
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3061
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
.annotate 'line', 3062
    isa $I1, $P1, 'IndexExpr'
    unless $I1 goto __label_5
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3063
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3064
    self.'annotate'(__ARG_1)
.annotate 'line', 3065
    __ARG_1.'print'("    exists ", $S1, ', ')
.annotate 'line', 3066
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3067
    __ARG_1.'say'()
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 3070
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_4: # endif
# }
.annotate 'line', 3071

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3072
# Body
# {
.annotate 'line', 3074
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3075
# reg: $S1
    $P2 = self.'tempreg'('I')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 3076
    isa $I1, $P1, 'IndexExpr'
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3077
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3078
    self.'annotate'(__ARG_1)
.annotate 'line', 3079
    __ARG_1.'print'("    exists ", $S1, ', ')
.annotate 'line', 3080
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3081
    __ARG_1.'say'()
.annotate 'line', 3082
    .return($S1)
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 3085
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_2: # endif
# }
.annotate 'line', 3086

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3056
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3093
# Body
# {
.annotate 'line', 3095
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3096

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3097
# Body
# {
.annotate 'line', 3099
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3100
    .return(self)
# }
.annotate 'line', 3101

.end # set


.sub 'optimize' :method
.annotate 'line', 3102
# Body
# {
.annotate 'line', 3104
    self.'optimizearg'()
.annotate 'line', 3105
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3106
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3107
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3108
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $I2, $I1
    .tailcall 'integerValue'($P3, $P5, $I2)
# }
 __label_0: # endif
# {
.annotate 'line', 3111
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3112
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3113
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3114
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $N2, $N1
    .tailcall 'floatValue'($P3, $P5, $N2)
# }
 __label_1: # endif
# }
.annotate 'line', 3117
    .return(self)
# }
.annotate 'line', 3118

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3119
# Body
# {
.annotate 'line', 3121
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3122
    self.'annotate'(__ARG_1)
.annotate 'line', 3123
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3124

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3091
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'isnegable' :method
.annotate 'line', 3131
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
.annotate 'line', 3132
# Body
# {
.annotate 'line', 3134
    .return('I')
# }
.annotate 'line', 3135

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3136
# Body
# {
.annotate 'line', 3138
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3139
    .return(self)
# }
.annotate 'line', 3140

.end # set


.sub 'optimize' :method
.annotate 'line', 3141
# Body
# {
.annotate 'line', 3143
    self.'optimizearg'()
.annotate 'line', 3144
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3145
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3146
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3147
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3148
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall 'integerValue'($P3, $P4, $I2)
# }
 __label_0: # endif
.annotate 'line', 3150
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3151
    .tailcall $P1.'negated'()
 __label_1: # endif
.annotate 'line', 3152
    .return(self)
# }
.annotate 'line', 3153

.end # optimize


.sub 'negated' :method
.annotate 'line', 3154
# Body
# {
.annotate 'line', 3156
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3157

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3158
# Body
# {
.annotate 'line', 3160
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3161
    self.'annotate'(__ARG_1)
.annotate 'line', 3162
# type: $S2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3163
    set $S3, $S2
    set $S4, 'I'
    if $S3 == $S4 goto __label_4
    set $S4, 'P'
    if $S3 == $S4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 3165
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 3168
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 3171
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
 __label_2: # switch end
# }
.annotate 'line', 3173

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3129
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3180
# Body
# {
.annotate 'line', 3182
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3183

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3184
# Body
# {
.annotate 'line', 3186
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3187
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3188
    .return(self)
# }
.annotate 'line', 3189

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3190
# Body
# {
.annotate 'line', 3192
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3193
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3194
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3195

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3196
# Body
# {
.annotate 'line', 3198
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3199
    self.'annotate'(__ARG_1)
.annotate 'line', 3200
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3201
    .return($S1)
# }
.annotate 'line', 3202

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3178
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3209
# Body
# {
.annotate 'line', 3211
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3212
    .return(self)
# }
.annotate 'line', 3213

.end # set


.sub 'checkresult' :method
.annotate 'line', 3214
# Body
# {
.annotate 'line', 3216
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3217

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3218
# Body
# {
.annotate 'line', 3220
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3221
    self.'annotate'(__ARG_1)
.annotate 'line', 3222
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3223
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3224
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3225
    .return($S1)
# }
.annotate 'line', 3226

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3207
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3233
# Body
# {
.annotate 'line', 3235
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3236

.end # checkresult


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


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3242
# Body
# {
.annotate 'line', 3244
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3245
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3246
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3247

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3248
# Body
# {
.annotate 'line', 3250
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3251
    self.'annotate'(__ARG_1)
.annotate 'line', 3252
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3253
    .return($S1)
# }
.annotate 'line', 3254

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3231
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 3261
# Body
# {
.annotate 'line', 3263
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3264
    .return(self)
# }
.annotate 'line', 3265

.end # set


.sub 'checkresult' :method
.annotate 'line', 3266
# Body
# {
.annotate 'line', 3268
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3269

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3270
# Body
# {
.annotate 'line', 3272
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3273
    self.'annotate'(__ARG_1)
.annotate 'line', 3274
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3275
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3276
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3277
    .return($S1)
# }
.annotate 'line', 3278

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3259
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3287
# Body
# {
.annotate 'line', 3289
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3290
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3291
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3292
    .return(self)
# }
.annotate 'line', 3293

.end # set


.sub 'checkresult' :method
.annotate 'line', 3294
# Body
# {
.annotate 'line', 3296
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3297

.end # checkresult


.sub 'optimize_base' :method
.annotate 'line', 3298
# Body
# {
.annotate 'line', 3300
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3301
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3302
    .return(self)
# }
.annotate 'line', 3303

.end # optimize_base


.sub 'optimize' :method
.annotate 'line', 3304
# Body
# {
.annotate 'line', 3306
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3307

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3308
# Body
# {
.annotate 'line', 3310
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3311
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3312
    self.'annotate'(__ARG_1)
.annotate 'line', 3313
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_1: # endif
# }
.annotate 'line', 3315

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3283
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3285
    addattribute $P0, 'lexpr'
.annotate 'line', 3286
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3322
# Body
# {
.annotate 'line', 3324
    self.'annotate'(__ARG_1)
.annotate 'line', 3325
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3326
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3327

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3320
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3334
# Body
# {
.annotate 'line', 3336
    self.'annotate'(__ARG_1)
.annotate 'line', 3337
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3338
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_2
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3339
    __ARG_1.'emitassign'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3340

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3341
# Body
# {
.annotate 'line', 3343
    self.'annotate'(__ARG_1)
.annotate 'line', 3344
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3345
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3346
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3347
    .return($S1)
# }
.annotate 'line', 3348

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3332
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3355
# Body
# {
.annotate 'line', 3357
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3358
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3359
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3360
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3361
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3362
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_5
    isa $I1, $P2, 'ConcatString'
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 3363
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3365
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_6
    set $S4, $P3
 __label_6:
.annotate 'line', 3366
# aux: $S5
    null $S5
.annotate 'line', 3367
    self.'annotate'(__ARG_1)
.annotate 'line', 3368
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
.annotate 'line', 3370
    eq $S2, 'S', __label_12
# {
.annotate 'line', 3371
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3372
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3373
    set $S4, $S5
# }
 __label_12: # endif
.annotate 'line', 3375
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
.annotate 'line', 3379
    eq $S1, $S2, __label_13
# {
.annotate 'line', 3380
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3381
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3382
    set $S4, $S5
# }
 __label_13: # endif
.annotate 'line', 3384
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 3387
    __ARG_1.'emitaddto'($S3, $S4)
 __label_7: # switch end
# }
 __label_4: # endif
.annotate 'line', 3390
    .return($S3)
# }
.annotate 'line', 3391

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3353
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3398
# Body
# {
.annotate 'line', 3400
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3401
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3402
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3403
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3404
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3405
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 3406
# aux: $S5
    null $S5
.annotate 'line', 3407
    self.'annotate'(__ARG_1)
.annotate 'line', 3408
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
.annotate 'line', 3410
    getattribute $P3, self, 'start'
    'InternalError'('-= to string must not happen', $P3)
 __label_7: # case
 __label_8: # case
.annotate 'line', 3413
    eq $S1, $S2, __label_9
# {
.annotate 'line', 3414
    $P4 = self.'tempreg'($S1)
    set $S5, $P4
.annotate 'line', 3415
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3416
    set $S4, $S5
# }
 __label_9: # endif
.annotate 'line', 3418
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 3421
    __ARG_1.'emitsubto'($S3, $S4)
 __label_4: # switch end
.annotate 'line', 3423
    .return($S3)
# }
.annotate 'line', 3424

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3396
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3431
# Body
# {
.annotate 'line', 3433
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3434
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3435
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3436
# rreg: $S4
    null $S4
.annotate 'line', 3437
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 3439
    ne $S2, 'I', __label_6
.annotate 'line', 3440
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 3442
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3443
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
 __label_7: # endif
.annotate 'line', 3445
    self.'annotate'(__ARG_1)
.annotate 'line', 3446
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 3449
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3450
    self.'annotate'(__ARG_1)
.annotate 'line', 3451
    __ARG_1.'emitarg2'('mul', $S3, $S4)
 __label_3: # switch end
.annotate 'line', 3453
    .return($S3)
# }
.annotate 'line', 3454

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3429
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3461
# Body
# {
.annotate 'line', 3463
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3464
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3465
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3466
    self.'annotate'(__ARG_1)
.annotate 'line', 3467
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3468
    .return($S2)
# }
.annotate 'line', 3469

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3459
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 3476
# Body
# {
.annotate 'line', 3478
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3479
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3480
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3481
    self.'annotate'(__ARG_1)
.annotate 'line', 3482
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3483
    .return($S2)
# }
.annotate 'line', 3484

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3474
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3491
# Body
# {
    .return('I')
# }

.end # checkresult


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 3492
# Body
# {
.annotate 'line', 3494
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3495
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3496
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3497
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
 __label_3:
.annotate 'line', 3498
    self.'annotate'(__ARG_1)
.annotate 'line', 3499
# aux: $S5
    null $S5
.annotate 'line', 3500
    iseq $I1, $S1, 'N'
    if $I1 goto __label_6
    iseq $I1, $S2, 'N'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3502
    ne $S1, 'I', __label_7
# {
.annotate 'line', 3503
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3504
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3505
    set $S3, $S5
# }
 __label_7: # endif
.annotate 'line', 3507
    ne $S2, 'I', __label_8
# {
.annotate 'line', 3508
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3509
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3510
    set $S4, $S5
# }
 __label_8: # endif
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 3513
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
 __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 3514
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3515
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3516
    set $S3, $S5
# }
    goto __label_10
 __label_9: # else
.annotate 'line', 3518
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 3519
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3520
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3521
    set $S4, $S5
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 3523
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'P'
 __label_17:
    unless $I1 goto __label_15
# {
.annotate 'line', 3524
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3525
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3526
    set $S3, $S5
# }
    goto __label_16
 __label_15: # else
.annotate 'line', 3528
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_19
    iseq $I1, $S1, 'S'
 __label_19:
    unless $I1 goto __label_18
# {
.annotate 'line', 3529
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3530
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3531
    set $S4, $S5
# }
 __label_18: # endif
 __label_16: # endif
 __label_13: # endif
 __label_10: # endif
 __label_5: # endif
.annotate 'line', 3534
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
.annotate 'line', 3536
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_23: # case
.annotate 'line', 3539
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_24: # case
.annotate 'line', 3542
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_21: # default
 __label_20: # switch end
.annotate 'line', 3543
# }
.annotate 'line', 3545

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3546
# Body
# {
.annotate 'line', 3548
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3549

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3550
# Body
# {
.annotate 'line', 3552
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3553

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3554
# Body
# {
.annotate 'line', 3556
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3557

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3489
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
.annotate 'line', 3570
# Body
# {
.annotate 'line', 3572
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3573
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3574
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3575

.end # NullCheckerExpr


.sub 'checkresult' :method
.annotate 'line', 3576
# Body
# {
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
.annotate 'line', 3577
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
.annotate 'line', 3578
# Body
# {
.annotate 'line', 3580
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3581
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3582
    .return(self)
# }
.annotate 'line', 3583

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3584
# Body
# {
.annotate 'line', 3586
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3587
    self.'annotate'(__ARG_1)
.annotate 'line', 3588
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3589
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3590
    __ARG_1.'emitarg1'('not', __ARG_2)
 __label_1: # endif
# }
.annotate 'line', 3591

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 3592
# Body
# {
.annotate 'line', 3594
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3595
    self.'annotate'(__ARG_1)
.annotate 'line', 3596
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
.annotate 'line', 3597

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3565
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3567
    addattribute $P0, 'expr'
.annotate 'line', 3568
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 3604
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
.annotate 'line', 3605
# Body
# {
.annotate 'line', 3607
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3608

.end # negated


.sub 'optimize' :method
.annotate 'line', 3609
# Body
# {
.annotate 'line', 3611
    self.'optimizearg'()
.annotate 'line', 3612
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3613
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3614
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3615
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3616
    unless $I1 goto __label_0
# {
.annotate 'line', 3617
    unless $I2 goto __label_1
.annotate 'line', 3618
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
 __label_1: # else
.annotate 'line', 3620
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3622
    unless $I2 goto __label_3
.annotate 'line', 3623
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3624
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_5
    $I3 = $P2.'isliteral'()
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 3625
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3626
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3627
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_9
    iseq $I3, $S2, 'S'
 __label_9:
    unless $I3 goto __label_8
# {
.annotate 'line', 3628
# ls: $S3
    getattribute $P4, $P1, 'strval'
    getattribute $P3, $P4, 'str'
    null $S3
    if_null $P3, __label_10
    set $S3, $P3
 __label_10:
.annotate 'line', 3629
# rs: $S4
    getattribute $P4, $P2, 'strval'
    getattribute $P3, $P4, 'str'
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
 __label_11:
.annotate 'line', 3630
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    iseq $I3, $S3, $S4
    .tailcall 'integerValue'($P3, $P4, $I3)
# }
 __label_8: # endif
# }
 __label_4: # endif
.annotate 'line', 3633
    .return(self)
# }
.annotate 'line', 3634

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3635
# Body
# {
.annotate 'line', 3637
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3638

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3639
# Body
# {
.annotate 'line', 3641
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3642

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3643
# Body
# {
.annotate 'line', 3645
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3646

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3647
# Body
# {
.annotate 'line', 3649
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3650

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3602
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 3657
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
.annotate 'line', 3658
# Body
# {
.annotate 'line', 3660
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3661

.end # negated


.sub 'optimize' :method
.annotate 'line', 3662
# Body
# {
.annotate 'line', 3664
    self.'optimizearg'()
.annotate 'line', 3665
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3666
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3667
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3668
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3669
    unless $I1 goto __label_0
# {
.annotate 'line', 3670
    unless $I2 goto __label_1
.annotate 'line', 3671
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
 __label_1: # else
.annotate 'line', 3673
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3675
    unless $I2 goto __label_3
.annotate 'line', 3676
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3677
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_5
    $I3 = $P2.'isliteral'()
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 3678
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3679
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3680
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_9
    iseq $I3, $S2, 'S'
 __label_9:
    unless $I3 goto __label_8
# {
.annotate 'line', 3681
# ls: $S3
    getattribute $P4, $P1, 'strval'
    getattribute $P3, $P4, 'str'
    null $S3
    if_null $P3, __label_10
    set $S3, $P3
 __label_10:
.annotate 'line', 3682
# rs: $S4
    getattribute $P4, $P2, 'strval'
    getattribute $P3, $P4, 'str'
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
 __label_11:
.annotate 'line', 3683
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    isne $I3, $S3, $S4
    .tailcall 'integerValue'($P3, $P4, $I3)
# }
 __label_8: # endif
# }
 __label_4: # endif
.annotate 'line', 3686
    .return(self)
# }
.annotate 'line', 3687

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3688
# Body
# {
.annotate 'line', 3690
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3691

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3692
# Body
# {
.annotate 'line', 3694
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3695

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3696
# Body
# {
.annotate 'line', 3698
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3699

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3700
# Body
# {
.annotate 'line', 3702
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3703

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3655
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
.annotate 'line', 3711
# Body
# {
.annotate 'line', 3713
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3714
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3715

.end # OpSameExpr


.sub 'isnegable' :method
.annotate 'line', 3716
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
.annotate 'line', 3717
# Body
# {
.annotate 'line', 3719
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3720
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
.annotate 'line', 3721

.end # negated


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3722
# Body
# {
.annotate 'line', 3724
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3725
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
 __label_1:
    set $S1, 'isntsame'
 __label_0:
.annotate 'line', 3726
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3727

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3728
# Body
# {
.annotate 'line', 3730
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3731

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3732
# Body
# {
.annotate 'line', 3734
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3735
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
 __label_1:
    set $S1, 'ne_addr'
 __label_0:
.annotate 'line', 3736
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3737

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3738
# Body
# {
.annotate 'line', 3740
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3741
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
 __label_1:
    set $S1, 'eq_addr'
 __label_0:
.annotate 'line', 3742
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3743

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3708
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3710
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
.annotate 'line', 3750
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
.annotate 'line', 3751
# Body
# {
.annotate 'line', 3753
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3754

.end # negated


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3755
# Body
# {
.annotate 'line', 3757
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3758

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3759
# Body
# {
.annotate 'line', 3761
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3762

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3763
# Body
# {
.annotate 'line', 3765
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3766

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3748
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
.annotate 'line', 3773
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
.annotate 'line', 3774
# Body
# {
.annotate 'line', 3776
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3777

.end # negated


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3778
# Body
# {
.annotate 'line', 3780
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3781

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3782
# Body
# {
.annotate 'line', 3784
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3785

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3786
# Body
# {
.annotate 'line', 3788
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3789

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3771
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 3796
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
.annotate 'line', 3797
# Body
# {
.annotate 'line', 3799
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3800

.end # negated


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3801
# Body
# {
.annotate 'line', 3803
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3804

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3805
# Body
# {
.annotate 'line', 3807
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3808

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3809
# Body
# {
.annotate 'line', 3811
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3812

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3794
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
.annotate 'line', 3819
# Body
# {
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
.annotate 'line', 3820
# Body
# {
.annotate 'line', 3822
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3823

.end # negated


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3824
# Body
# {
.annotate 'line', 3826
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3827

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3828
# Body
# {
.annotate 'line', 3830
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3831

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
.annotate 'line', 3832
# Body
# {
.annotate 'line', 3834
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3835

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3817
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
.annotate 'line', 3842
# Body
# {
.annotate 'line', 3844
    .return('I')
# }
.annotate 'line', 3845

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3840
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method
.annotate 'line', 3852
# Body
# {
.annotate 'line', 3854
    self.'optimizearg'()
.annotate 'line', 3855
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3856
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3857
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3858
    eq $I1, 0, __label_1
.annotate 'line', 3859
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3861
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3863
    .return(self)
# }
.annotate 'line', 3864

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3865
# Body
# {
.annotate 'line', 3867
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
.annotate 'line', 3868
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3869
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
 __label_6:
.annotate 'line', 3870
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
 __label_7:
.annotate 'line', 3871
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3874
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
 __label_8:
.annotate 'line', 3875
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3876
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3877
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3878
    __ARG_1.'emitlabel'($S4)
# }
 __label_4: # endif
# }
.annotate 'line', 3880

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3850
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method
.annotate 'line', 3887
# Body
# {
.annotate 'line', 3889
    self.'optimizearg'()
.annotate 'line', 3890
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3891
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3892
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3893
    ne $I1, 0, __label_1
.annotate 'line', 3894
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3896
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3898
    .return(self)
# }
.annotate 'line', 3899

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3900
# Body
# {
.annotate 'line', 3902
# res: $S1
    null $S1
.annotate 'line', 3903
    if_null __ARG_2, __label_0
.annotate 'line', 3904
    set $S1, __ARG_2
    goto __label_1
 __label_0: # else
.annotate 'line', 3906
    $P1 = self.'tempreg'('I')
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 3907
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 3908
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 3909
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
 __label_6:
.annotate 'line', 3910
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 3913
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
 __label_7:
.annotate 'line', 3914
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3915
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3916
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3917
    __ARG_1.'emitlabel'($S4)
# }
 __label_3: # endif
# }
.annotate 'line', 3919

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3885
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3924
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3932
# Body
# {
.annotate 'line', 3934
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
.annotate 'line', 3935
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 3936
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 3937
    self.'annotate'(__ARG_1)
.annotate 'line', 3938
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3939

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 3940
# Body
# {
.annotate 'line', 3942
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3943

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3930
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3950
# Body
# {
.annotate 'line', 3952
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
.annotate 'line', 3953
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 3954
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 3955
    self.'annotate'(__ARG_1)
.annotate 'line', 3956
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 3957

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 3958
# Body
# {
.annotate 'line', 3960
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3961

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3948
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 3968
# Body
# {
.annotate 'line', 3970
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
.annotate 'line', 3971
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 3972
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 3973
    self.'annotate'(__ARG_1)
.annotate 'line', 3974
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 3975

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 3976
# Body
# {
.annotate 'line', 3978
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3979

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 3966
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 3987
# Body
# {
.annotate 'line', 3989
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3990
    isa $I1, __ARG_3, 'ConcatString'
    unless $I1 goto __label_0
# {
.annotate 'line', 3991
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 3992
    isa $I1, __ARG_4, 'ConcatString'
    unless $I1 goto __label_2
.annotate 'line', 3993
    getattribute $P1, self, 'values'
    getattribute $P2, __ARG_4, 'values'
    $P1.'append'($P2)
    goto __label_3
 __label_2: # else
.annotate 'line', 3995
    getattribute $P3, self, 'values'
# predefined push
    push $P3, __ARG_4
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 3997
    isa $I1, __ARG_4, 'ConcatString'
    unless $I1 goto __label_4
# {
.annotate 'line', 3998
    getattribute $P2, __ARG_4, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 3999
    getattribute $P1, self, 'values'
    $P1.'unshift'(__ARG_3)
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4002
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_3
    push $P2, __ARG_4
    setattribute self, 'values', $P2
 __label_5: # endif
 __label_1: # endif
# }
.annotate 'line', 4003

.end # ConcatString


.sub 'checkresult' :method
.annotate 'line', 4004
# Body
# {
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
.annotate 'line', 4005
# Body
# {
.annotate 'line', 4007
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4008
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4009
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4010
# i: $I2
    null $I2
# for loop
.annotate 'line', 4011
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4012
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
 __label_0: # for iteration
.annotate 'line', 4011
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4013
    .return($P2)
# }
.annotate 'line', 4014

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4015
# Body
# {
.annotate 'line', 4017
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4018
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4019
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4020
    self.'annotate'(__ARG_1)
.annotate 'line', 4021
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4022
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4023
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_0: # for iteration
.annotate 'line', 4022
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4024
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4025

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4026
# Body
# {
.annotate 'line', 4028
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4029
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4030
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4031
    self.'annotate'(__ARG_1)
.annotate 'line', 4032
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4033
# i: $I2
    set $I2, 2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4034
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_1: # for iteration
.annotate 'line', 4033
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4035
    .return($S1)
# }
.annotate 'line', 4036

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4037
# Body
# {
.annotate 'line', 4039
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4040
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4041
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4042
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4043
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4042
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4044

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4045
# Body
# {
.annotate 'line', 4047
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4048
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4049
    self.'annotate'(__ARG_1)
.annotate 'line', 4050
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4051
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4052
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4051
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4053

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 3984
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3986
    addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method
.annotate 'line', 4060
# Body
# {
.annotate 'line', 4062
    self.'optimizearg'()
.annotate 'line', 4063
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4064
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4065
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
 __label_0:
.annotate 'line', 4066
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
 __label_1:
.annotate 'line', 4067
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
 __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4068
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
 __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4069
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4070
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4071
# var t: $P5
    null $P5
.annotate 'line', 4072
# es: $S3
    getattribute $P10, $P3, 'str'
    null $S3
    if_null $P10, __label_6
    set $S3, $P10
 __label_6:
.annotate 'line', 4073
# rs: $S4
    getattribute $P10, $P4, 'str'
    null $S4
    if_null $P10, __label_7
    set $S4, $P10
 __label_7:
.annotate 'line', 4074
    isa $I3, $P3, 'TypeSingleQuoted'
    unless $I3 goto __label_10
    isa $I3, $P4, 'TypeSingleQuoted'
 __label_10:
    unless $I3 goto __label_8
.annotate 'line', 4075
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_9
 __label_8: # else
.annotate 'line', 4077
    new $P13, [ 'TokenQuoted' ]
    getattribute $P14, $P3, 'file'
    getattribute $P15, $P3, 'line'
    concat $S6, $S3, $S4
    $P13.'TokenQuoted'($P14, $P15, $S6)
    set $P5, $P13
 __label_9: # endif
.annotate 'line', 4078
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
 __label_4: # endif
.annotate 'line', 4080
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_12
    iseq $I3, $S2, 'I'
 __label_12:
    unless $I3 goto __label_11
# {
.annotate 'line', 4081
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4082
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4083
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4084
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4085
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
 __label_11: # endif
# {
.annotate 'line', 4088
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_13
    unless $P10 goto __label_13
# {
.annotate 'line', 4089
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4090
# lf: $N1
# predefined string
    set $S5, $P8
    set $N1, $S5
.annotate 'line', 4091
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4092
# rf: $N2
# predefined string
    set $S5, $P9
    set $N2, $S5
.annotate 'line', 4093
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
 __label_13: # endif
# }
# }
 __label_2: # endif
.annotate 'line', 4097
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_15
    iseq $I3, $S2, 'S'
 __label_15:
    unless $I3 goto __label_14
# {
.annotate 'line', 4098
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
 __label_14: # endif
.annotate 'line', 4100
    .return(self)
# }
.annotate 'line', 4101

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 4102
# Body
# {
.annotate 'line', 4104
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4105
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4106
    ne $S1, $S2, __label_2
.annotate 'line', 4107
    .return($S1)
 __label_2: # endif
.annotate 'line', 4108
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4109
    .return('S')
 __label_3: # endif
.annotate 'line', 4110
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4111
    .return('S')
 __label_5: # endif
.annotate 'line', 4112
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4113
    .return('N')
 __label_7: # endif
.annotate 'line', 4114
    .return('I')
# }
.annotate 'line', 4115

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4116
# Body
# {
.annotate 'line', 4118
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4119
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4120
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4121
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4122
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 4124
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 4125
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
 __label_4:
.annotate 'line', 4126
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4127
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
 __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4128
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
 __label_9:
.annotate 'line', 4129
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4130
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4131
    set $S4, $S6
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 4134
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4135
    set $S5, $S6
# }
 __label_11: # endif
# }
 __label_7: # endif
.annotate 'line', 4138
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4141
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
 __label_15:
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4142
# l: $S7
    null $S7
.annotate 'line', 4143
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4145
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4146
    __ARG_1.'emitset'($S7, $S4)
# }
 __label_17: # endif
.annotate 'line', 4148
# r: $S8
    null $S8
.annotate 'line', 4149
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
 __label_18: # else
# {
.annotate 'line', 4151
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4152
    __ARG_1.'emitset'($S8, $S5)
# }
 __label_19: # endif
.annotate 'line', 4154
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 4157
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
 __label_13: # endif
# }
 __label_6: # endif
# }
.annotate 'line', 4159

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4058
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method
.annotate 'line', 4166
# Body
# {
.annotate 'line', 4168
    self.'optimizearg'()
.annotate 'line', 4169
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4170
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4171
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4172
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4173
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4174
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4175
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4176
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4177
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4178
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4179
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 4182
    .return(self)
# }
.annotate 'line', 4183

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 4184
# Body
# {
.annotate 'line', 4186
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4187
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4188
    ne $S1, $S2, __label_2
.annotate 'line', 4189
    .return($S1)
 __label_2: # endif
.annotate 'line', 4190
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4191
    .return('N')
 __label_3: # endif
.annotate 'line', 4192
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4193
    .return('N')
 __label_5: # endif
.annotate 'line', 4194
    .return('I')
# }
.annotate 'line', 4195

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4196
# Body
# {
.annotate 'line', 4198
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4199
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4200
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4201

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4164
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method
.annotate 'line', 4208
# Body
# {
.annotate 'line', 4210
    self.'optimizearg'()
.annotate 'line', 4211
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4212
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4213
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4214
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 4215
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
 __label_3:
.annotate 'line', 4216
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4217
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4218
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4219
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4220
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4221
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
 __label_4: # endif
# {
.annotate 'line', 4224
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4225
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4226
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4227
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4228
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4229
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
 __label_6: # endif
# }
# }
 __label_0: # endif
.annotate 'line', 4233
    .return(self)
# }
.annotate 'line', 4234

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 4235
# Body
# {
.annotate 'line', 4237
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4238
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4239
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4240
    ne $S1, $S2, __label_2
.annotate 'line', 4241
    .return($S1)
 __label_2: # endif
.annotate 'line', 4242
    ne $S1, 'S', __label_3
.annotate 'line', 4243
    .return('S')
    goto __label_4
 __label_3: # else
.annotate 'line', 4245
    .return('N')
 __label_4: # endif
# }
.annotate 'line', 4246

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4247
# Body
# {
.annotate 'line', 4249
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4250
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4251
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4252
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4253
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4254
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4255
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4256
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4257
# rval: $S5
    null $S5
.annotate 'line', 4258
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 4260
    set $S5, $S4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 4263
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4264
    __ARG_1.'emitset'($S5, $S4)
 __label_3: # switch end
.annotate 'line', 4266
    self.'annotate'(__ARG_1)
.annotate 'line', 4267
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4268
    .return()
# }
 __label_2: # endif
.annotate 'line', 4270
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
.annotate 'line', 4271
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4272
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4273
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4274
    .return()
# }
 __label_6: # endif
.annotate 'line', 4279
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4280
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4281
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4282
# rval: $S6
    null $S6
.annotate 'line', 4283
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
# switch
 __label_13: # case
.annotate 'line', 4285
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4286
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4287
    set $S6, $S4
    goto __label_11 # break
 __label_14: # case
.annotate 'line', 4290
    set $S6, $S4
    goto __label_11 # break
 __label_12: # default
.annotate 'line', 4293
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4294
    __ARG_1.'emitset'($S6, $S4)
 __label_11: # switch end
.annotate 'line', 4296
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4297
    self.'annotate'(__ARG_1)
.annotate 'line', 4298
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
 __label_15: # endif
.annotate 'line', 4300
    .return()
# }
 __label_10: # endif
.annotate 'line', 4303
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4304
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
 __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4305
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4306
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4309
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4310
    set $S3, $I1
# }
 __label_17: # endif
.annotate 'line', 4312
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4313
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4314
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 4317
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
.annotate 'line', 4319
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4320
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
 __label_25: # case
.annotate 'line', 4323
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
 __label_26: # case
 __label_23: # default
.annotate 'line', 4327
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4328
    set $S4, $I2
    goto __label_22 # break
 __label_22: # switch end
.annotate 'line', 4329
# }
 __label_20: # endif
.annotate 'line', 4332
    self.'annotate'(__ARG_1)
.annotate 'line', 4333
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4334
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
 __label_27: # endif
.annotate 'line', 4335
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4336

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4206
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method
.annotate 'line', 4343
# Body
# {
.annotate 'line', 4345
    self.'optimizearg'()
.annotate 'line', 4346
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4347
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4348
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4349
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4350
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4351
# var lval: $P3
    null $P3
.annotate 'line', 4352
# var rval: $P4
    null $P4
.annotate 'line', 4353
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4354
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4355
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4356
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4357
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4358
    eq $I2, 0, __label_6
.annotate 'line', 4359
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
.annotate 'line', 4362
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4363
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4364
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4365
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4366
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4367
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4368
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
.annotate 'line', 4372
    .return(self)
# }
.annotate 'line', 4373

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 4374
# Body
# {
.annotate 'line', 4376
    .return('N')
# }
.annotate 'line', 4377

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4378
# Body
# {
.annotate 'line', 4380
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4381
# var aux: $P2
    null $P2
.annotate 'line', 4382
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4383
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4384
    $P2 = self.'tempreg'('N')
.annotate 'line', 4385
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4386
    set $P3, $P2
# }
 __label_0: # endif
.annotate 'line', 4388
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4389
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4390
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4391
    $P2 = self.'tempreg'('N')
.annotate 'line', 4392
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4393
    set $P5, $P2
# }
 __label_1: # endif
.annotate 'line', 4395
    self.'annotate'(__ARG_1)
.annotate 'line', 4396
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4397

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4341
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4404
# Body
# {
.annotate 'line', 4406
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4407
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4408
    self.'annotate'(__ARG_1)
.annotate 'line', 4409
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4410

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4411
# Body
# {
.annotate 'line', 4413
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4414

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4402
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method
.annotate 'line', 4421
# Body
# {
.annotate 'line', 4423
    .return('I')
# }
.annotate 'line', 4424

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4425
# Body
# {
.annotate 'line', 4427
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4428
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4429
    self.'annotate'(__ARG_1)
.annotate 'line', 4434
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4435

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4419
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4442
# Body
# {
.annotate 'line', 4444
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
.annotate 'line', 4445
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4446
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4447
    self.'annotate'(__ARG_1)
.annotate 'line', 4448
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4449

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4450
# Body
# {
.annotate 'line', 4452
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4453

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4440
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4460
# Body
# {
.annotate 'line', 4462
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
.annotate 'line', 4463
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4464
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4465
    self.'annotate'(__ARG_1)
.annotate 'line', 4466
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4467

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
.annotate 'line', 4468
# Body
# {
.annotate 'line', 4470
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4471

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4458
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4480
# Body
# {
.annotate 'line', 4482
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4483
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4484

.end # Argument


.sub 'optimize' :method
.annotate 'line', 4485
# Body
# {
.annotate 'line', 4487
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4488
    .return(self)
# }
.annotate 'line', 4489

.end # optimize


.sub 'hascompilevalue' :method
.annotate 'line', 4490
# Body
# {
.annotate 'line', 4492
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4493

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4478
    addattribute $P0, 'arg'
.annotate 'line', 4479
    addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.annotate 'line', 4503
# Body
# {
.annotate 'line', 4505
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4506
    setattribute self, 'start', __ARG_2
.annotate 'line', 4507
# var args: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4508
# var t: $P2
    $P2 = __ARG_3.'get'()
.annotate 'line', 4509
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 4510
    __ARG_3.'unget'($P2)
 __label_1: # do
.annotate 'line', 4511
# {
.annotate 'line', 4512
# var modifier: $P3
    null $P3
.annotate 'line', 4513
# var expr: $P4
    $P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4514
    $P2 = __ARG_3.'get'()
.annotate 'line', 4515
    $P5 = $P2.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4516
    $P2 = __ARG_3.'get'()
.annotate 'line', 4517
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4518
    new $P6, [ 'ModifierList' ]
    $P6.'ModifierList'(__ARG_3, __ARG_1)
    set $P3, $P6
.annotate 'line', 4519
    $P2 = __ARG_3.'get'()
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4522
    'InternalError'('Checking implementation')
# }
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 4525
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P4, $P3)
    set $P5, $P6
# predefined push
    push $P1, $P5
# }
 __label_3: # continue
.annotate 'line', 4526
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 4527
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_7
.annotate 'line', 4528
    'SyntaxError'("Unfinished argument list", $P2)
 __label_7: # endif
.annotate 'line', 4529
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_8
.annotate 'line', 4530
    setattribute self, 'args', $P1
 __label_8: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 4532

.end # ArgumentList


.sub 'numargs' :method
.annotate 'line', 4533
# Body
# {
.annotate 'line', 4535
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4536
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
    .return($I1)
# }
.annotate 'line', 4537

.end # numargs


.sub 'getrawargs' :method
.annotate 'line', 4538
# Body
# {
.annotate 'line', 4540
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4541

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
.annotate 'line', 4542
# Body
# {
.annotate 'line', 4544
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4545
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4546

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
.annotate 'line', 4547
# Body
# {
.annotate 'line', 4549
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4550
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4551

.end # getfreearg


.sub 'optimize' :method
.annotate 'line', 4552
# Body
# {
.annotate 'line', 4554
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 4555
    .return(self)
# }
.annotate 'line', 4556

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
.annotate 'line', 4557
# Body
# {
.annotate 'line', 4559
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4560
    unless_null $P1, __label_0
# {
.annotate 'line', 4561
    new $P2, ['ResizableStringArray']
.annotate 'line', 4562
# pnull: $S1
    set $S1, ''
.annotate 'line', 4563
    set $P1, $P2
.annotate 'line', 4564
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4565
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4566
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4567
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4568
# reg: $S2
    null $S2
.annotate 'line', 4569
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4571
    ne $S1, '', __label_6
# {
.annotate 'line', 4572
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4573
    __ARG_1.'emitnull'($S1)
# }
 __label_6: # endif
.annotate 'line', 4575
    set $S2, $S1
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4578
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
 __label_5: # endif
.annotate 'line', 4579
# predefined push
    push $P1, $S2
# }
 __label_1: # for iteration
.annotate 'line', 4566
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4581
    setattribute self, 'argregs', $P1
# }
 __label_0: # endif
.annotate 'line', 4583
    .return($P1)
# }
.annotate 'line', 4584

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
.annotate 'line', 4585
# Body
# {
.annotate 'line', 4587
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4588
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4590
# sep: $S1
    set $S1, ''
.annotate 'line', 4591
# n: $I1
    $P6 = self.'numargs'()
    set $I1, $P6
# for loop
.annotate 'line', 4592
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4593
# a: $S2
    $S2 = $P2[$I2]
.annotate 'line', 4594
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 4595
# isflat: $I3
    null $I3
# isnamed: $I4
    null $I4
.annotate 'line', 4596
# setname: $S3
    set $S3, ''
.annotate 'line', 4597
# var modifiers: $P3
    $P6 = $P1[$I2]
    getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4598
    if_null $P3, __label_3
# {
.annotate 'line', 4599
    $P6 = $P3.'getlist'()
    iter $P7, $P6
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4600
# name: $S4
    $P8 = $P4.'getname'()
    null $S4
    if_null $P8, __label_6
    set $S4, $P8
 __label_6:
.annotate 'line', 4601
    ne $S4, 'flat', __label_7
.annotate 'line', 4602
    set $I3, 1
 __label_7: # endif
.annotate 'line', 4603
    ne $S4, 'named', __label_8
# {
.annotate 'line', 4604
    set $I4, 1
.annotate 'line', 4605
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
.annotate 'line', 4609
# var argmod: $P5
    $P5 = $P4.'getarg'(0)
.annotate 'line', 4610
    $P8 = $P5.'isstringliteral'()
    isfalse $I7, $P8
    unless $I7 goto __label_13
.annotate 'line', 4611
    getattribute $P9, self, 'start'
    'SyntaxError'('Invalid modifier', $P9)
 __label_13: # endif
.annotate 'line', 4612
    $P10 = $P5.'getPirString'()
    set $S3, $P10
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 4615
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
.annotate 'line', 4620
    and $I5, $I3, $I4
    unless $I5 goto __label_14
.annotate 'line', 4621
    __ARG_1.'print'(' :flat :named')
    goto __label_15
 __label_14: # else
.annotate 'line', 4622
    unless $I3 goto __label_16
.annotate 'line', 4623
    __ARG_1.'print'(' :flat')
    goto __label_17
 __label_16: # else
.annotate 'line', 4624
    unless $I4 goto __label_18
# {
.annotate 'line', 4625
    __ARG_1.'print'(' :named')
.annotate 'line', 4626
    eq $S3, '', __label_19
.annotate 'line', 4627
    __ARG_1.'print'("(", $S3, ")")
 __label_19: # endif
# }
 __label_18: # endif
 __label_17: # endif
 __label_15: # endif
.annotate 'line', 4629
    set $S1, ', '
# }
 __label_0: # for iteration
.annotate 'line', 4592
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4631

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4498
    addattribute $P0, 'owner'
.annotate 'line', 4499
    addattribute $P0, 'start'
.annotate 'line', 4500
    addattribute $P0, 'args'
.annotate 'line', 4501
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
        .param pmc __ARG_1
.annotate 'line', 4634
# Body
# {
.annotate 'line', 4636
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4637
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4638
    .return(0)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4639
    .return(1)
# }
.annotate 'line', 4640

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4649
# Body
# {
.annotate 'line', 4651
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4652
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4653
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4654

.end # CallPredefExpr


.sub 'checkresult' :method
.annotate 'line', 4655
# Body
# {
.annotate 'line', 4657
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4658

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4659
# Body
# {
.annotate 'line', 4661
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4662
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4663
    new $P3, ['ResizableStringArray']
.annotate 'line', 4664
# var arg: $P4
    null $P4
.annotate 'line', 4665
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4666
# pnull: $S1
    set $S1, ''
.annotate 'line', 4667
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 4669
    iter $P7, $P2
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4670
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 4672
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4673
    ne $S1, '', __label_8
# {
.annotate 'line', 4674
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4675
    __ARG_1.'emitnull'($S1)
# }
 __label_8: # endif
.annotate 'line', 4677
    set $S2, $S1
# }
 __label_7: # endif
.annotate 'line', 4679
# predefined push
    push $P3, $S2
# }
    goto __label_4
 __label_5: # endfor
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 4683
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4684
    iter $P9, $P2
    set $P9, 0
 __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4685
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
 __label_10: # endfor
.annotate 'line', 4686
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4687
    .return()
 __label_1: # default
.annotate 'line', 4689
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4690
# i: $I3
    null $I3
 __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4691
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4692
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
 __label_14:
.annotate 'line', 4693
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
 __label_15:
.annotate 'line', 4694
# argr: $S5
    null $S5
.annotate 'line', 4695
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
.annotate 'line', 4696
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
.annotate 'line', 4700
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4701
    __ARG_1.'emitnull'($S5)
    goto __label_18 # break
 __label_19: # default
.annotate 'line', 4704
    ne $S1, '', __label_23
# {
.annotate 'line', 4705
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4706
    __ARG_1.'emitnull'($S1)
# }
 __label_23: # endif
.annotate 'line', 4708
    set $S5, $S1
 __label_18: # switch end
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4712
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
 __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4713
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 4715
# aux: $S6
    null $S6
.annotate 'line', 4716
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
.annotate 'line', 4717
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
.annotate 'line', 4719
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
.annotate 'line', 4723
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4724
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 4727
    $P4.'emit'(__ARG_1, $S5)
 __label_33: # switch end
    goto __label_27 # break
 __label_30: # case
 __label_31: # case
 __label_32: # case
.annotate 'line', 4733
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4734
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
 __label_28: # default
.annotate 'line', 4737
    $P4.'emit'(__ARG_1, $S5)
 __label_27: # switch end
# }
 __label_25: # endif
# }
 __label_17: # endif
.annotate 'line', 4741
# predefined push
    push $P3, $S5
# }
 __label_11: # for iteration
.annotate 'line', 4690
    inc $I3
    goto __label_13
 __label_12: # for end
 __label_0: # switch end
.annotate 'line', 4744
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4745

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4644
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4646
    addattribute $P0, 'predef'
.annotate 'line', 4647
    addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4755
# Body
# {
.annotate 'line', 4757
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4758
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4759
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4760
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4761
    __ARG_1.'unget'($P1)
.annotate 'line', 4762
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 4764

.end # CallExpr


.sub 'checkresult' :method
.annotate 'line', 4765
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 4766
# Body
# {
.annotate 'line', 4768
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4769
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4770
# nargs: $I1
    null $I1
.annotate 'line', 4771
    if_null $P2, __label_0
# {
.annotate 'line', 4772
    $P2 = $P2.'optimize'()
.annotate 'line', 4773
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
 __label_0: # endif
.annotate 'line', 4776
    isa $I2, $P1, 'MemberExpr'
    unless $I2 goto __label_1
.annotate 'line', 4777
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_1: # endif
.annotate 'line', 4778
    isa $I2, $P1, 'MemberRefExpr'
    unless $I2 goto __label_2
.annotate 'line', 4779
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_2: # endif
.annotate 'line', 4782
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4783
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 4784
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4785
    if_null $P3, __label_5
# {
.annotate 'line', 4786
    self.'use_predef'($S1)
.annotate 'line', 4787
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
 __label_7:
    $P4 = $P2.'getrawargs'()
 __label_6:
.annotate 'line', 4790
    isa $I2, $P3, 'PredefFunctionEval'
    unless $I2 goto __label_8
# {
.annotate 'line', 4791
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4792
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4793
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
 __label_9: # endif
# }
 __label_8: # endif
.annotate 'line', 4797
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
.annotate 'line', 4801
    setattribute self, 'funref', $P1
.annotate 'line', 4802
    setattribute self, 'args', $P2
.annotate 'line', 4803
    .return(self)
# }
.annotate 'line', 4804

.end # optimize


.sub 'cantailcall' :method
.annotate 'line', 4805
# Body
# {
.annotate 'line', 4807
    .return(1)
# }
.annotate 'line', 4808

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 4809
# Body
# {
.annotate 'line', 4811
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4812
# call: $S1
    null $S1
.annotate 'line', 4813
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4814
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 4815
    ne $S1, '', __label_2
.annotate 'line', 4816
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
.annotate 'line', 4819
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 4820
    .return($S1)
# }
.annotate 'line', 4821

.end # emitcall


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4822
# Body
# {
.annotate 'line', 4824
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4825
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4826
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4827
    if_null $P2, __label_1
.annotate 'line', 4828
    $P2.'getargvalues'(__ARG_1)
 __label_1: # endif
.annotate 'line', 4830
    self.'annotate'(__ARG_1)
.annotate 'line', 4832
    __ARG_1.'print'('    ')
.annotate 'line', 4833
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 4834
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 4835
    __ARG_1.'print'('.tailcall ')
    goto __label_5
 __label_4: # else
.annotate 'line', 4837
    __ARG_1.'print'(__ARG_2, ' = ')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 4840
    __ARG_1.'print'($S1)
.annotate 'line', 4841
    __ARG_1.'print'('(')
.annotate 'line', 4842
    if_null $P2, __label_6
.annotate 'line', 4843
    $P2.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 4844
    __ARG_1.'say'(')')
# }
.annotate 'line', 4845

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4750
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4752
    addattribute $P0, 'funref'
.annotate 'line', 4753
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4855
# Body
# {
.annotate 'line', 4857
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4858
    setattribute self, 'funref', __ARG_2
.annotate 'line', 4859
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4860

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 4861
# Body
# {
.annotate 'line', 4863
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4864
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 4865
    $P5 = $P1.'get_member'()
.annotate 'line', 4864
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 4866

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 4853
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4874
# Body
# {
.annotate 'line', 4876
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4877
    setattribute self, 'funref', __ARG_2
.annotate 'line', 4878
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4879

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.annotate 'line', 4880
# Body
# {
.annotate 'line', 4882
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4883
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 4884
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 4885
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 4886
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
 __label_0: # endif
.annotate 'line', 4889
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
 __label_2:
.annotate 'line', 4890
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
 __label_3:
.annotate 'line', 4891
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 4892

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 4872
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 4900
# Body
# {
.annotate 'line', 4902
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4903
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 4904

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
.annotate 'line', 4905
# Body
# {
.annotate 'line', 4907
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 4908
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4909
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4910
    eq $S1, 'P', __label_2
# {
.annotate 'line', 4911
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 4912
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 4913
    __ARG_1.'emitbox'($S2, $S3)
# }
 __label_2: # endif
.annotate 'line', 4915
    .return($S2)
# }
.annotate 'line', 4916

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 4897
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4899
    addattribute $P0, 'left'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 4923
# Body
# {
.annotate 'line', 4925
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4926
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 4927

.end # MemberExpr


.sub 'checkresult' :method
.annotate 'line', 4928
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 4929
# Body
# {
.annotate 'line', 4931
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 4932
    .return(self)
# }
.annotate 'line', 4933

.end # optimize


.sub 'get_member' :method
.annotate 'line', 4934
# Body
# {
.annotate 'line', 4936
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 4937

.end # get_member


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 4938
# Body
# {
.annotate 'line', 4940
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4941
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4942
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 4943
    self.'annotate'(__ARG_1)
.annotate 'line', 4944
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4945
    .return($S3)
# }
.annotate 'line', 4946

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4947
# Body
# {
.annotate 'line', 4949
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4950
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4951
    self.'annotate'(__ARG_1)
.annotate 'line', 4952
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 4953

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4954
# Body
# {
.annotate 'line', 4956
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4957

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 4958
# Body
# {
.annotate 'line', 4960
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4961
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4962
# value: $S3
    null $S3
.annotate 'line', 4963
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 4965
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 4966
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 4967
    __ARG_1.'emitnull'(__ARG_3)
# }
 __label_4: # endif
.annotate 'line', 4969
    set $S3, __ARG_3
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 4972
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 4973
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
 __label_3: # endif
.annotate 'line', 4975
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 4976

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 4977
# Body
# {
.annotate 'line', 4979
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4980
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4981
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 4982
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 4983
    __ARG_1.'emitnull'($S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 4985
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
 __label_5:
.annotate 'line', 4986
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 4987
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
 __label_6: # else
.annotate 'line', 4989
    set $S3, $S4
 __label_7: # endif
# }
 __label_4: # endif
.annotate 'line', 4991
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 4992
    .return($S3)
# }
.annotate 'line', 4993

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4919
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 4921
    addattribute $P0, 'right'
.end
.namespace [ 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5001
# Body
# {
.annotate 'line', 5003
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5004
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5005

.end # MemberRefExpr


.sub 'checkresult' :method
.annotate 'line', 5006
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 5007
# Body
# {
.annotate 'line', 5009
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5010
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5011
    .return(self)
# }
.annotate 'line', 5012

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5013
# Body
# {
.annotate 'line', 5016
    getattribute $P1, self, 'start'
.annotate 'line', 5015
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 5017

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 4998
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5000
    addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5028
# Body
# {
.annotate 'line', 5030
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5031
    setattribute self, 'left', __ARG_4
.annotate 'line', 5032
    self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5033

.end # IndexExpr


.sub 'checkresult' :method
.annotate 'line', 5034
# Body
# {
.annotate 'line', 5036
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5037
    .return('S')
    goto __label_1
 __label_0: # else
.annotate 'line', 5039
    .return('P')
 __label_1: # endif
# }
.annotate 'line', 5040

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 5041
# Body
# {
.annotate 'line', 5043
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 5044
    setattribute self, 'left', $P1
.annotate 'line', 5045
    self.'optimizeargs'()
.annotate 'line', 5049
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P4 = self.'numargs'()
    set $I3, $P4
    iseq $I2, $I3, 1
 __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5050
# var arg: $P2
    $P2 = self.'getarg'(0)
.annotate 'line', 5051
    $P4 = $P2.'isintegerliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 5052
# ival: $I1
    $P5 = $P2.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5053
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 5054
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, self, 'start'
    getattribute $P5, $P4, 'file'
    getattribute $P6, self, 'start'
    getattribute $P7, $P6, 'line'
.annotate 'line', 5055
# predefined substr
    substr $S2, $S1, $I1, 1
    $P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5056
    new $P5, [ 'StringLiteral' ]
    getattribute $P6, self, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5059
    .return(self)
# }
.annotate 'line', 5060

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.annotate 'line', 5061
# Body
# {
.annotate 'line', 5063
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5064
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5065
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5066
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
 __label_0: # endif
.annotate 'line', 5067
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5068
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
 __label_2: # else
.annotate 'line', 5070
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
 __label_3: # endif
.annotate 'line', 5071
    setattribute self, 'regleft', $P1
.annotate 'line', 5072
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5073
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5074

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.annotate 'line', 5075
# Body
# {
.annotate 'line', 5077
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5078
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5079
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5080
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
 __label_0: # endif
.annotate 'line', 5081
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5082
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5083
    __ARG_1.'print'(']')
# }
.annotate 'line', 5084

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5085
# Body
# {
.annotate 'line', 5087
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5088
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5089
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5090
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5091
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5092
    eq $I1, 1, __label_3
.annotate 'line', 5093
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
 __label_3: # endif
.annotate 'line', 5094
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5095
    __ARG_2 = self.'tempreg'('S')
 __label_4: # endif
.annotate 'line', 5096
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 5099
    self.'annotate'(__ARG_1)
.annotate 'line', 5100
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5101
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5102
    __ARG_1.'say'('')
# }
 __label_2: # endif
# }
.annotate 'line', 5104

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.annotate 'line', 5105
# Body
# {
.annotate 'line', 5107
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5108
    self.'annotate'(__ARG_1)
.annotate 'line', 5109
    __ARG_1.'print'('    ')
.annotate 'line', 5110
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5111
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5112

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5113
# Body
# {
.annotate 'line', 5115
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5116
# rreg: $S1
    null $S1
.annotate 'line', 5117
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5118
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5119
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5122
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5123
    self.'annotate'(__ARG_1)
.annotate 'line', 5124
    __ARG_1.'print'('    ')
.annotate 'line', 5125
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5126
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5127
    .return($S1)
# }
.annotate 'line', 5128

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5022
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'SimpleArgList' ]
    addparent $P0, $P2
.annotate 'line', 5024
    addattribute $P0, 'left'
.annotate 'line', 5025
    addattribute $P0, 'regleft'
.annotate 'line', 5026
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 5137
# Body
# {
.annotate 'line', 5139
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5140
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
.annotate 'line', 5141
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5142
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 5143
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5144
# {
.annotate 'line', 5145
# var item: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5146
    getattribute $P3, self, 'values'
# predefined push
    push $P3, $P2
# }
 __label_3: # continue
.annotate 'line', 5147
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 5148
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 5149
    'Expected'("']' or ','", $P1)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 5151

.end # ArrayExpr


.sub 'checkresult' :method
.annotate 'line', 5152
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 5153
# Body
# {
.annotate 'line', 5155
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5156
    .return(self)
# }
.annotate 'line', 5157

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5158
# Body
# {
.annotate 'line', 5160
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5161
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 5162
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5168
    self.'emit_init'(__ARG_1, '')
# }
 __label_1: # endif
# }
.annotate 'line', 5170

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 5171
# Body
# {
.annotate 'line', 5173
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5174
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5175
    .return($S1)
# }
.annotate 'line', 5176

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 5177
# Body
# {
.annotate 'line', 5179
    self.'annotate'(__ARG_1)
.annotate 'line', 5180
# itemreg: $S1
    null $S1
.annotate 'line', 5181
# it_p: $S2
    null $S2
.annotate 'line', 5182
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5183
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5184
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
 __label_0: # endif
.annotate 'line', 5186
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5187
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
 __label_3:
.annotate 'line', 5188
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
.annotate 'line', 5190
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 5191
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5192
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5193
    set $S1, $S2
# }
 __label_10: # endif
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 5197
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5198
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5199
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5200
    __ARG_1.'emitnull'($S1)
# }
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
.annotate 'line', 5204
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_12: # endif
 __label_4: # switch end
.annotate 'line', 5206
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5207
    self.'annotate'(__ARG_1)
.annotate 'line', 5208
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
 __label_14: # endif
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 5211

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5133
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5135
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 5221
# Body
# {
.annotate 'line', 5223
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5224
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5225
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5226
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5227
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5228
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5229
# {
.annotate 'line', 5230
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5231
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5232
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5233
# predefined push
    push $P2, $P4
.annotate 'line', 5234
# predefined push
    push $P3, $P5
# }
 __label_3: # continue
.annotate 'line', 5236
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
 __label_2: # enddo
.annotate 'line', 5237
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5238
    'Expected'("',' or '}'", $P1)
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 5240
    setattribute self, 'keys', $P2
.annotate 'line', 5241
    setattribute self, 'values', $P3
# }
.annotate 'line', 5242

.end # HashExpr


.sub 'checkresult' :method
.annotate 'line', 5243
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.annotate 'line', 5244
# Body
# {
.annotate 'line', 5246
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5247
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5248
    .return(self)
# }
.annotate 'line', 5249

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5250
# Body
# {
.annotate 'line', 5252
    self.'annotate'(__ARG_1)
.annotate 'line', 5257
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5258
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
 __label_0: # endif
.annotate 'line', 5260
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5261
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5262
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5263
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5264
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5265
# item: $S1
    null $S1
.annotate 'line', 5266
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5267
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5268
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5269
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5272
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
 __label_5: # endif
.annotate 'line', 5274
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5275
# itemreg: $S3
    null $S3
.annotate 'line', 5276
    $P5 = $P4.'isnull'()
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 5277
    set $S6, __ARG_2
    eq $S6, '', __label_9
# {
.annotate 'line', 5278
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5279
    __ARG_1.'emitnull'($S3)
# }
 __label_9: # endif
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5282
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5283
# s: $S4
    $P6 = $P4.'checkIdentifier'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 5284
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
 __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5285
    set $S3, $S4
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 5287
# id: $S5
    $P5 = $P4.'getName'()
    null $S5
    if_null $P5, __label_16
    set $S5, $P5
 __label_16:
.annotate 'line', 5288
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5289
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5290
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
 __label_17: # else
.annotate 'line', 5293
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_18: # endif
# }
 __label_14: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 5297
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_11: # endif
 __label_8: # endif
.annotate 'line', 5298
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5299
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
 __label_19: # endif
# }
 __label_1: # for iteration
.annotate 'line', 5263
    inc $I2
    goto __label_3
 __label_2: # for end
# }
.annotate 'line', 5301

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 5302
# Body
# {
.annotate 'line', 5304
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5305
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5306
    .return($S1)
# }
.annotate 'line', 5307

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5216
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5218
    addattribute $P0, 'keys'
.annotate 'line', 5219
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
.annotate 'line', 5316
# Body
# {
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
.annotate 'line', 5317
# Body
# {
.annotate 'line', 5321
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 5322
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5323
    $P5 = $P2.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 5324
    __ARG_1.'unget'($P2)
.annotate 'line', 5325
# var initializer: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
 __label_1: # do
.annotate 'line', 5326
# {
.annotate 'line', 5327
# var auxinit: $P4
    $P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5328
# predefined push
    push $P3, $P4
# }
 __label_3: # continue
.annotate 'line', 5329
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 5330
    setattribute self, 'initializer', $P3
.annotate 'line', 5331
    'RequireOp'(')', $P2)
# }
 __label_0: # endif
# }
.annotate 'line', 5333

.end # parseinitializer


.sub 'optimize' :method
.annotate 'line', 5334
# Body
# {
.annotate 'line', 5336
    getattribute $P1, self, 'initializer'
    'optimize_array'($P1)
.annotate 'line', 5337
    .return(self)
# }
.annotate 'line', 5338

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5312
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5314
    addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5347
# Body
# {
.annotate 'line', 5349
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5351
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
 __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5352
    'SyntaxError'("Unimplemented", __ARG_4)
 __label_0: # endif
.annotate 'line', 5353
    setattribute self, 'value', __ARG_4
.annotate 'line', 5354
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5356
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5357
    self.'parseinitializer'(__ARG_1)
    goto __label_3
 __label_2: # else
.annotate 'line', 5359
    __ARG_1.'unget'($P1)
 __label_3: # endif
# }
.annotate 'line', 5360

.end # NewExpr


.sub 'optimize' :method
.annotate 'line', 5361
# Body
# {
.annotate 'line', 5363
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5364
    isa $I1, $P1, 'Token'
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5367
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5368
# var desc: $P3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'getvar'($P2)
.annotate 'line', 5369
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5370
    $P4 = $P3.'getid'()
    unless_null $P4, __label_4
# {
.annotate 'line', 5371
    $P1 = $P3.'getvalue'()
.annotate 'line', 5372
    isa $I2, $P1, 'StringLiteral'
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5373
    'SyntaxError'('Constant value must evaluate to a string', $P1)
 __label_6: # endif
.annotate 'line', 5374
    getattribute $P5, $P1, 'strval'
    setattribute self, 'value', $P5
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5377
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
 __label_5: # endif
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5381
    getattribute $P4, self, 'initializer'
    'optimize_array'($P4)
.annotate 'line', 5382
    .return(self)
# }
.annotate 'line', 5383

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.annotate 'line', 5384
# Body
# {
.annotate 'line', 5386
    self.'annotate'(__ARG_1)
.annotate 'line', 5388
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5389
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
.annotate 'line', 5392
# type: $I2
    getattribute $P9, self, 'value'
    $P8 = $P9.'isstring'()
    if_null $P8, __label_3
    unless $P8 goto __label_3
    null $I2
    goto __label_2
 __label_3:
.annotate 'line', 5393
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
.annotate 'line', 5395
# reginit: $S1
    set $S1, ''
.annotate 'line', 5396
# regnew: $S2
    set $P8, __ARG_2
    null $S2
    if_null $P8, __label_6
    set $S2, $P8
 __label_6:
.annotate 'line', 5397
# constructor: $S3
    null $S3
.annotate 'line', 5398
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
.annotate 'line', 5402
    ne $I2, 1, __label_11
# {
.annotate 'line', 5403
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 5404
    $P8 = self.'tempreg'('P')
    set $S2, $P8
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
# {
.annotate 'line', 5407
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5408
    $P8 = $P2.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 5409
    concat $S0, ', ', $S1
    set $S1, $S0
# }
 __label_12: # endif
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 5413
    eq $I2, 1, __label_14
.annotate 'line', 5414
    getattribute $P8, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P8)
 __label_14: # endif
.annotate 'line', 5415
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 5416
    $P9 = self.'tempreg'('P')
    set $S2, $P9
 __label_15: # endif
 __label_7: # switch end
.annotate 'line', 5419
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_18
    set $I4, 1
    if $I3 == $I4 goto __label_19
    goto __label_17
# switch
 __label_18: # case
.annotate 'line', 5422
# name: $S4
    getattribute $P9, self, 'value'
    $P8 = $P9.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
 __label_20:
.annotate 'line', 5423
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5424
    isnull $I5, $P3
    unless $I5 goto __label_22
    $I5 = self.'dowarnings'()
 __label_22:
    unless $I5 goto __label_21
.annotate 'line', 5425
    concat $S6, "Can't locate class ", $S4
    concat $S6, $S6, " at compile time"
    getattribute $P10, self, 'value'
    'Warn'($S6, $P10)
 __label_21: # endif
.annotate 'line', 5429
    getattribute $P11, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P11, " ]", $S1)
.annotate 'line', 5430
    le $I1, 1, __label_23
# {
.annotate 'line', 5431
    getattribute $P12, self, 'value'
    __ARG_1.'say'($S2, ".'", $P12, "'()")
# }
 __label_23: # endif
    goto __label_16 # break
 __label_19: # case
.annotate 'line', 5435
# var id: $P4
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P4 = $P8.'getvar'($P9)
.annotate 'line', 5436
    unless_null $P4, __label_24
# {
.annotate 'line', 5438
# var cl: $P5
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'value'
    $P5 = $P10.'checkclass'($P11)
.annotate 'line', 5439
    if_null $P5, __label_26
# {
.annotate 'line', 5440
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
# }
    goto __label_27
 __label_26: # else
# {
.annotate 'line', 5443
    $P8 = self.'dowarnings'()
    if_null $P8, __label_28
    unless $P8 goto __label_28
.annotate 'line', 5444
    'Warn'('Checking: new unknown type')
 __label_28: # endif
.annotate 'line', 5445
    getattribute $P8, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P8, "']", $S1)
# }
 __label_27: # endif
.annotate 'line', 5447
    getattribute $P8, self, 'value'
    set $S3, $P8
# }
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 5451
    $P8 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
# }
 __label_25: # endif
    goto __label_16 # break
 __label_17: # default
.annotate 'line', 5455
    'InternalError'('Unexpected type in new')
 __label_16: # switch end
.annotate 'line', 5457
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isgt $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
 __label_31:
 __label_30:
    unless $I3 goto __label_29
# {
.annotate 'line', 5458
    new $P6, ['ResizableStringArray']
.annotate 'line', 5459
    iter $P13, $P1
    set $P13, 0
 __label_32: # for iteration
    unless $P13 goto __label_33
    shift $P7, $P13
# {
.annotate 'line', 5460
# reg: $S5
    $P8 = $P7.'emit_get'(__ARG_1)
    null $S5
    if_null $P8, __label_34
    set $S5, $P8
 __label_34:
.annotate 'line', 5461
# predefined push
    push $P6, $S5
# }
    goto __label_32
 __label_33: # endfor
.annotate 'line', 5463
    __ARG_1.'print'('    ', $S2, ".'", $S3, "'(")
.annotate 'line', 5464
# predefined join
    join $S6, ", ", $P6
    __ARG_1.'print'($S6)
.annotate 'line', 5465
    __ARG_1.'say'(")")
.annotate 'line', 5466
    not $I3, __ARG_3
    unless $I3 goto __label_35
.annotate 'line', 5467
    __ARG_1.'emitset'(__ARG_2, $S2)
 __label_35: # endif
# }
 __label_29: # endif
# }
.annotate 'line', 5469

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5470
# Body
# {
.annotate 'line', 5472
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5473

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5343
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5345
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 5482
# Body
# {
.annotate 'line', 5484
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5485
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5486
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5487
    setattribute self, 'nskey', $P1
.annotate 'line', 5488
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5489
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5490
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5492
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5493

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5494
# Body
# {
.annotate 'line', 5496
# reginit: $S1
    null $S1
.annotate 'line', 5497
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5498
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5499
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
.annotate 'line', 5503
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5504
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5507
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
 __label_2: # switch end
.annotate 'line', 5509
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5510
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5511
    __ARG_1.'print'("root_")
 __label_6: # endif
.annotate 'line', 5512
    __ARG_1.'print'('    ', 'new ', __ARG_2, ", ")
.annotate 'line', 5513
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5514
    if_null $S1, __label_7
.annotate 'line', 5515
    __ARG_1.'print'(', ', $S1)
 __label_7: # endif
.annotate 'line', 5516
    __ARG_1.'say'()
# }
.annotate 'line', 5517

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5478
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5480
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 5526
# Body
# {
.annotate 'line', 5528
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5529
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5530
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5531
    setattribute self, 'nskey', $P1
.annotate 'line', 5532
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5533
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5534
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5536
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5537

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5538
# Body
# {
.annotate 'line', 5540
# reginit: $S1
    null $S1
.annotate 'line', 5541
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5543
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5544
# regnew: $S2
    set $P5, __ARG_2
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
 __label_2:
.annotate 'line', 5545
    le $I1, 0, __label_3
.annotate 'line', 5546
    $P5 = self.'tempreg'('P')
    set $S2, $P5
 __label_3: # endif
.annotate 'line', 5547
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5548
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5549
    getattribute $P5, self, 'owner'
    $P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5550
    __ARG_1.'say'()
.annotate 'line', 5552
    le $I1, 0, __label_4
# {
.annotate 'line', 5553
    new $P3, ['ResizableStringArray']
.annotate 'line', 5554
    iter $P6, $P1
    set $P6, 0
 __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P4, $P6
# {
.annotate 'line', 5555
# reg: $S3
    $P5 = $P4.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
 __label_7:
.annotate 'line', 5556
# predefined push
    push $P3, $S3
# }
    goto __label_5
 __label_6: # endfor
.annotate 'line', 5558
# constructor: $S4
    $P5 = $P2.'last'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
 __label_8:
.annotate 'line', 5559
    __ARG_1.'print'('    ', $S2, ".'", $S4, "'(")
.annotate 'line', 5560
# predefined join
    join $S5, ", ", $P3
    __ARG_1.'print'($S5)
.annotate 'line', 5561
    __ARG_1.'say'(")")
.annotate 'line', 5562
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
 __label_4: # endif
# }
.annotate 'line', 5564

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5522
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5524
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 5569
# Body
# {
.annotate 'line', 5571
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5573
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 5575
    new $P5, [ 'CallExpr' ]
.annotate 'line', 5576
    new $P7, [ 'StringLiteral' ]
    $P7.'StringLiteral'(__ARG_2, __ARG_3)
    set $P6, $P7
    $P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
    set $P4, $P5
.annotate 'line', 5575
    .return($P4)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5578
    $P3 = $P1.'isop'('[')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 5580
    new $P5, [ 'NewIndexedExpr' ]
    $P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 5582
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 5585
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5586
    __ARG_1.'unget'($P2)
.annotate 'line', 5587
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 5589
    new $P5, [ 'NewQualifiedExpr' ]
    $P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 5593
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
.annotate 'line', 5598
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_5: # endif
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5600

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 5609
# Body
# {
.annotate 'line', 5611
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5612
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5613
    $P2 = __ARG_4.'get'()
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5614

.end # OpInstanceOfExpr


.sub 'checkresult' :method
.annotate 'line', 5615
# Body
# {
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5616
# Body
# {
.annotate 'line', 5618
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5619
# checkedval: $S1
    null $S1
.annotate 'line', 5620
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 5621
    $P3 = $P1.'getidentifier'()
    set $S1, $P3
.annotate 'line', 5622
    concat $S0, "'", $S1
    concat $S0, $S0, "'"
    set $S1, $S0
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5625
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5626
# r: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 5627
    self.'annotate'(__ARG_1)
.annotate 'line', 5628
    __ARG_1.'say'('    ', 'isa ', __ARG_2, ', ', $S2, ', ', $S1)
# }
.annotate 'line', 5629

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5604
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5606
    addattribute $P0, 'lexpr'
.annotate 'line', 5607
    addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 5644
# Body
# {
.annotate 'line', 5646
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5647
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5648
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5649
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5650
    .return(self)
# }
.annotate 'line', 5651

.end # set


.sub 'optimize' :method
.annotate 'line', 5652
# Body
# {
.annotate 'line', 5654
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 5655
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
.annotate 'line', 5657
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
 __label_3: # case
.annotate 'line', 5659
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
 __label_1: # default
.annotate 'line', 5661
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5662
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5663
    .return(self)
 __label_0: # switch end
# }
.annotate 'line', 5665

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 5666
# Body
# {
.annotate 'line', 5668
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5669

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5670
# Body
# {
.annotate 'line', 5672
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5673
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5674
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5675
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5676
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5677
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5678
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5679
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5680

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5634
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5640
    addattribute $P0, 'condition'
.annotate 'line', 5641
    addattribute $P0, 'etrue'
.annotate 'line', 5642
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
.annotate 'line', 5722
# Body
# {
.annotate 'line', 5724
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
.annotate 'line', 5725
    .return(1)
 __label_3: # case
.annotate 'line', 5726
    .return(2)
 __label_4: # case
.annotate 'line', 5727
    .return(3)
 __label_1: # default
.annotate 'line', 5728
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5730

.end # getOpCode_2


.sub 'getOpCode_4'
        .param pmc __ARG_1
.annotate 'line', 5732
# Body
# {
.annotate 'line', 5734
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
.annotate 'line', 5735
    .return(8)
 __label_3: # case
.annotate 'line', 5736
    .return(11)
 __label_4: # case
.annotate 'line', 5737
    .return(9)
 __label_5: # case
.annotate 'line', 5738
    .return(10)
 __label_1: # default
.annotate 'line', 5740
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
 __label_6: # else
.annotate 'line', 5741
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
 __label_8: # else
.annotate 'line', 5742
    .return(0)
 __label_9: # endif
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5744

.end # getOpCode_4


.sub 'getOpCode_5'
        .param pmc __ARG_1
.annotate 'line', 5746
# Body
# {
.annotate 'line', 5748
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
.annotate 'line', 5749
    .return(19)
 __label_3: # case
.annotate 'line', 5750
    .return(20)
 __label_4: # case
.annotate 'line', 5751
    .return(21)
 __label_5: # case
.annotate 'line', 5752
    .return(22)
 __label_1: # default
.annotate 'line', 5753
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5755

.end # getOpCode_5


.sub 'getOpCode_7'
        .param pmc __ARG_1
.annotate 'line', 5757
# Body
# {
.annotate 'line', 5759
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5760
    .return(28)
 __label_3: # case
.annotate 'line', 5761
    .return(29)
 __label_1: # default
.annotate 'line', 5762
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5764

.end # getOpCode_7


.sub 'getOpCode_8'
        .param pmc __ARG_1
.annotate 'line', 5766
# Body
# {
.annotate 'line', 5768
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
.annotate 'line', 5769
    .return(14)
 __label_3: # case
.annotate 'line', 5770
    .return(16)
 __label_4: # case
.annotate 'line', 5771
    .return(15)
 __label_5: # case
.annotate 'line', 5772
    .return(17)
 __label_1: # default
.annotate 'line', 5774
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
 __label_6: # else
.annotate 'line', 5775
    .return(0)
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5777

.end # getOpCode_8


.sub 'getOpCode_9'
        .param pmc __ARG_1
.annotate 'line', 5779
# Body
# {
.annotate 'line', 5781
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
.annotate 'line', 5782
    .return(12)
 __label_3: # case
.annotate 'line', 5783
    .return(13)
 __label_4: # case
.annotate 'line', 5784
    .return(25)
 __label_5: # case
.annotate 'line', 5785
    .return(26)
 __label_1: # default
.annotate 'line', 5786
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5788

.end # getOpCode_9


.sub 'getOpCode_16'
        .param pmc __ARG_1
.annotate 'line', 5790
# Body
# {
.annotate 'line', 5792
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
.annotate 'line', 5793
    .return(4)
 __label_3: # case
.annotate 'line', 5794
    .return(5)
 __label_4: # case
.annotate 'line', 5795
    .return(6)
 __label_5: # case
.annotate 'line', 5796
    .return(18)
 __label_6: # case
.annotate 'line', 5797
    .return(23)
 __label_7: # case
.annotate 'line', 5798
    .return(24)
 __label_8: # case
.annotate 'line', 5799
    .return(30)
 __label_1: # default
.annotate 'line', 5800
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5802

.end # getOpCode_16


.sub 'parseExpr_0'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5804
# Body
# {
.annotate 'line', 5806
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5808
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5809
# var expr: $P2
    null $P2
.annotate 'line', 5810
    $P4 = $P1.'isop'('(')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 5811
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5812
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 5813
    .return($P2)
# }
 __label_0: # endif
.annotate 'line', 5815
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5816
    new $P6, [ 'ArrayExpr' ]
    $P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 5817
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5818
    new $P6, [ 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 5819
    $P4 = $P1.'isstring'()
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 5820
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_3: # endif
.annotate 'line', 5821
    $P4 = $P1.'isint'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5822
    new $P6, [ 'IntegerLiteral' ]
    $P6.'IntegerLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_4: # endif
.annotate 'line', 5823
    $P4 = $P1.'isfloat'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 5824
    new $P6, [ 'FloatLiteral' ]
    $P6.'FloatLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_5: # endif
.annotate 'line', 5825
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
.annotate 'line', 5827
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
 __label_9: # case
.annotate 'line', 5829
    new $P6, [ 'FunctionExpr' ]
    $P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_10: # case
.annotate 'line', 5831
    new $P8, [ 'OpClassExpr' ]
    $P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P7, $P8
    .return($P7)
 __label_7: # default
 __label_6: # switch end
.annotate 'line', 5833
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_11
    unless $P4 goto __label_11
.annotate 'line', 5834
    new $P6, [ 'IdentifierExpr' ]
    $P6.'IdentifierExpr'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_11: # endif
.annotate 'line', 5835
    'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5836

.end # parseExpr_0


.sub 'parseExpr_2'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5838
# Body
# {
.annotate 'line', 5840
.const 'Sub' $P5 = 'parseExpr_0'
.annotate 'line', 5841
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 5843
# var subexp: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5844
# var t: $P2
    null $P2
.annotate 'line', 5845
# var start: $P3
    null $P3
.annotate 'line', 5846
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 5847
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 5848
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
.annotate 'line', 5850
    new $P8, [ 'CallExpr' ]
    $P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P8
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5853
    new $P9, [ 'IndexExpr' ]
    $P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P9
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 5856
    set $P3, $P2
.annotate 'line', 5857
    $P2 = __ARG_1.'get'()
.annotate 'line', 5858
    $P10 = $P2.'isop'('*')
    if_null $P10, __label_7
    unless $P10 goto __label_7
# {
.annotate 'line', 5859
# var right: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5860
    new $P7, [ 'MemberRefExpr' ]
    $P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P7
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5863
    new $P7, [ 'MemberExpr' ]
    $P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
 __label_8: # endif
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5866
    'InternalError'('Unexpected code in parseExpr_2')
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 5869
    __ARG_1.'unget'($P2)
.annotate 'line', 5870
    .return($P1)
# }
.annotate 'line', 5871

.end # parseExpr_2


.sub 'parseExpr_3'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5873
# Body
# {
.annotate 'line', 5875
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5877
# var subexp: $P1
    $P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5878
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5879
    $P4 = $P2.'isop'('++')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 5880
    new $P5, [ 'OpPostIncExpr' ]
    .tailcall $P5.'set'(__ARG_2, $P2, $P1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5881
    $P6 = $P2.'isop'('--')
    if_null $P6, __label_2
    unless $P6 goto __label_2
.annotate 'line', 5882
    new $P7, [ 'OpPostDecExpr' ]
    .tailcall $P7.'set'(__ARG_2, $P2, $P1)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 5885
    __ARG_1.'unget'($P2)
.annotate 'line', 5886
    .return($P1)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5888

.end # parseExpr_3


.sub 'parseExpr_4'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5890
# Body
# {
.annotate 'line', 5892
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5893
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5894
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5896
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5897
# code: $I1
    $P7 = $P6($P1)
    set $I1, $P7
.annotate 'line', 5898
# var subexpr: $P2
    null $P2
.annotate 'line', 5899
    eq $I1, 0, __label_0
# {
.annotate 'line', 5900
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5901
# var oper: $P3
    null $P3
.annotate 'line', 5902
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
.annotate 'line', 5904
    new $P3, [ 'OpUnaryMinusExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5907
    new $P3, [ 'OpNotExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 5910
    new $P3, [ 'OpPreIncExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 5913
    new $P3, [ 'OpPreDecExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 5916
    new $P3, [ 'OpDeleteExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 5919
    new $P3, [ 'OpExistsExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5922
    'InternalError'('Invalid code in parseExpr_4', $P1)
 __label_2: # switch end
.annotate 'line', 5924
    $P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5927
    __ARG_1.'unget'($P1)
.annotate 'line', 5928
    $P2 = $P5(__ARG_1, __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 5930
    .return($P2)
# }
.annotate 'line', 5931

.end # parseExpr_4


.sub 'parseExpr_5'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5933
# Body
# {
.annotate 'line', 5935
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5936
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5938
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5939
# var t: $P2
    null $P2
.annotate 'line', 5940
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 5941
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 5942
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5943
# var aux: $P4
    null $P4
.annotate 'line', 5944
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
.annotate 'line', 5946
    new $P4, [ 'OpMulExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5949
    new $P4, [ 'OpDivExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 5952
    new $P4, [ 'OpModExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 5955
    new $P4, [ 'OpCModExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5958
    'InternalError'('Invalid code in parseExpr_5', $P2)
 __label_2: # switch end
.annotate 'line', 5960
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 5961
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 5963
    __ARG_1.'unget'($P2)
.annotate 'line', 5964
    .return($P1)
# }
.annotate 'line', 5965

.end # parseExpr_5


.sub 'parseExpr_6'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5967
# Body
# {
.annotate 'line', 5969
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 5971
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5972
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 5973
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 5974
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5975
# var expr: $P4
    null $P4
.annotate 'line', 5976
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 5977
    new $P7, [ 'OpAddExpr' ]
    $P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
    goto __label_4
 __label_3: # else
.annotate 'line', 5979
    new $P8, [ 'OpSubExpr' ]
    $P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
 __label_4: # endif
.annotate 'line', 5980
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 5982
    __ARG_1.'unget'($P2)
.annotate 'line', 5983
    .return($P1)
# }
.annotate 'line', 5984

.end # parseExpr_6


.sub 'parseExpr_7'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 5986
# Body
# {
.annotate 'line', 5988
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 5990
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5991
# var rexpr: $P2
    null $P2
.annotate 'line', 5992
# var t: $P3
    null $P3
.annotate 'line', 5993
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 5994
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
.annotate 'line', 5995
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 5997
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5998
    new $P6, [ 'OpShiftleftExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6001
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6002
    new $P7, [ 'OpShiftrightExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6005
    'InternalError'('Invalid code in parseExpr_7', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6008
    __ARG_1.'unget'($P3)
.annotate 'line', 6009
    .return($P1)
# }
.annotate 'line', 6010

.end # parseExpr_7


.sub 'parseExpr_8'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6012
# Body
# {
.annotate 'line', 6014
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 6015
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6017
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6018
# var rexpr: $P2
    null $P2
.annotate 'line', 6019
# var t: $P3
    null $P3
.annotate 'line', 6020
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6021
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6022
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
.annotate 'line', 6024
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6025
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6028
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6029
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6032
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6033
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6036
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6037
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6040
    new $P11, [ 'OpInstanceOfExpr' ]
    $P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6043
    'InternalError'('Invalid code in parseExpr_9', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6046
    __ARG_1.'unget'($P3)
.annotate 'line', 6047
    .return($P1)
# }
.annotate 'line', 6048

.end # parseExpr_8


.sub 'parseExpr_9'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6050
# Body
# {
.annotate 'line', 6052
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 6053
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6055
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6056
# var rexpr: $P2
    null $P2
.annotate 'line', 6057
# var t: $P3
    null $P3
.annotate 'line', 6058
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6059
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6060
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
.annotate 'line', 6062
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6063
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6066
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6067
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6070
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6071
    new $P9, [ 'OpSameExpr' ]
    $P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6074
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6075
    new $P10, [ 'OpSameExpr' ]
    $P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6078
    'InternalError'('Invalid code in parseExpr_8', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6081
    __ARG_1.'unget'($P3)
.annotate 'line', 6082
    .return($P1)
# }
.annotate 'line', 6083

.end # parseExpr_9


.sub 'parseExpr_10'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6085
# Body
# {
.annotate 'line', 6087
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6089
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6090
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6091
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6092
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6093
    new $P5, [ 'OpBinAndExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6095
    __ARG_1.'unget'($P2)
.annotate 'line', 6096
    .return($P1)
# }
.annotate 'line', 6097

.end # parseExpr_10


.sub 'parseExpr_11'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6099
# Body
# {
.annotate 'line', 6101
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6103
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6104
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6105
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6106
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6107
    new $P5, [ 'OpBinXorExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6109
    __ARG_1.'unget'($P2)
.annotate 'line', 6110
    .return($P1)
# }
.annotate 'line', 6111

.end # parseExpr_11


.sub 'parseExpr_12'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6113
# Body
# {
.annotate 'line', 6115
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6117
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6118
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6119
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6120
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6121
    new $P5, [ 'OpBinOrExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6123
    __ARG_1.'unget'($P2)
.annotate 'line', 6124
    .return($P1)
# }
.annotate 'line', 6125

.end # parseExpr_12


.sub 'parseExpr_13'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6127
# Body
# {
.annotate 'line', 6129
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6131
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6132
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6133
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6134
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6135
    new $P5, [ 'OpBoolAndExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6137
    __ARG_1.'unget'($P2)
.annotate 'line', 6138
    .return($P1)
# }
.annotate 'line', 6139

.end # parseExpr_13


.sub 'parseExpr_14'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6141
# Body
# {
.annotate 'line', 6143
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6145
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6146
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6147
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6148
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6149
    new $P5, [ 'OpBoolOrExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6151
    __ARG_1.'unget'($P2)
.annotate 'line', 6152
    .return($P1)
# }
.annotate 'line', 6153

.end # parseExpr_14


.sub 'parseExpr_15'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6155
# Body
# {
.annotate 'line', 6157
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6158
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6160
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6161
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6162
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6163
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6164
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6165
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6166
    new $P7, [ 'OpConditionalExpr' ]
    .tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6169
    __ARG_1.'unget'($P2)
.annotate 'line', 6170
    .return($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6172

.end # parseExpr_15


.sub 'parseExpr_16'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6174
# Body
# {
.annotate 'line', 6176
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6177
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 6178
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6180
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6181
# var t: $P2
    null $P2
.annotate 'line', 6182
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6183
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6184
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6185
# var expr: $P4
    null $P4
.annotate 'line', 6186
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
.annotate 'line', 6188
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6191
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6194
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6197
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6200
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 6203
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
 __label_10: # case
.annotate 'line', 6206
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6209
    'InternalError'('Unexpected code in parseExpr_16', $P2)
 __label_2: # switch end
.annotate 'line', 6211
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6212
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6214
    __ARG_1.'unget'($P2)
.annotate 'line', 6215
    .return($P1)
# }
.annotate 'line', 6216

.end # parseExpr_16


.sub 'parseExpr'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6218
# Body
# {
.annotate 'line', 6220
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6222
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6223

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
.annotate 'line', 6236
# Body
# {
.annotate 'line', 6238
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6239
    'InternalError'('attempt to generate break label twice')
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
    setattribute self, 'brlabel', $P1
.annotate 'line', 6242
    .return($S1)
# }
.annotate 'line', 6243

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.annotate 'line', 6244
# Body
# {
.annotate 'line', 6246
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6247
    unless_null $P1, __label_0
.annotate 'line', 6248
    'InternalError'('attempt to get break label before creating it')
 __label_0: # endif
.annotate 'line', 6249
    .return($P1)
# }
.annotate 'line', 6250

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6234
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
.annotate 'line', 6257
# Body
# {
.annotate 'line', 6259
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6260
    'InternalError'('attempt to generate continue label twice')
 __label_0: # endif
.annotate 'line', 6261
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6262
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6263
    .return($S1)
# }
.annotate 'line', 6264

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.annotate 'line', 6265
# Body
# {
.annotate 'line', 6267
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6268
    unless_null $P1, __label_0
.annotate 'line', 6269
    'InternalError'('attempt to get continue label before creating it')
 __label_0: # endif
.annotate 'line', 6270
    .return($P1)
# }
.annotate 'line', 6271

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6253
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6255
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6285
# Body
# {
.annotate 'line', 6287
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6288
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6289
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6290
    __ARG_2.'unget'($P1)
.annotate 'line', 6291
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 6293

.end # parse


.sub 'optimize' :method
.annotate 'line', 6294
# Body
# {
.annotate 'line', 6296
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6297
    if_null $P1, __label_0
.annotate 'line', 6298
    $P1 = $P1.'optimize'()
 __label_0: # endif
.annotate 'line', 6299
    .return(self)
# }
.annotate 'line', 6300

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6301
# Body
# {
.annotate 'line', 6304
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6305
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
 __label_0:
.annotate 'line', 6308
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, 'ReturnStatement'
 __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6309
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6310
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6311
    self.'annotate'(__ARG_1)
.annotate 'line', 6312
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 6316
    le $I1, 0, __label_5
.annotate 'line', 6317
    $P1.'getargvalues'(__ARG_1)
 __label_5: # endif
.annotate 'line', 6319
    self.'annotate'(__ARG_1)
.annotate 'line', 6320
    self.'emitret'(__ARG_1)
.annotate 'line', 6321
    le $I1, 0, __label_6
.annotate 'line', 6322
    $P1.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6323
    __ARG_1.'say'(')')
# }
.annotate 'line', 6324

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6281
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6283
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6329
# Body
# {
.annotate 'line', 6331
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6332

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 6333
# Body
# {
.annotate 'line', 6335
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6336

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6327
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6341
# Body
# {
.annotate 'line', 6343
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6344

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
.annotate 'line', 6345
# Body
# {
.annotate 'line', 6347
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6348

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6339
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 6359
# Body
# {
.annotate 'line', 6361
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6362
    setattribute self, 'name', __ARG_1
.annotate 'line', 6363
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6364
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6365

.end # LabelStatement


.sub 'optimize' :method
.annotate 'line', 6366
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6367
# Body
# {
.annotate 'line', 6369
    self.'annotate'(__ARG_1)
.annotate 'line', 6370
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6371
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6372
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6373

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6355
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6357
    addattribute $P0, 'name'
.annotate 'line', 6358
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
.annotate 'line', 6385
# Body
# {
.annotate 'line', 6387
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6388
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6389

.end # Reflabel


.sub 'optimize' :method
.annotate 'line', 6390
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
.annotate 'line', 6391
# Body
# {
.annotate 'line', 6393
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6394
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6395
    .return($S2)
# }
.annotate 'line', 6396

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6382
    addattribute $P0, 'owner'
.annotate 'line', 6383
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6407
# Body
# {
.annotate 'line', 6409
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6410
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6411
    'RequireIdentifier'($P1)
.annotate 'line', 6412
    setattribute self, 'label', $P1
.annotate 'line', 6413
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6414

.end # GotoStatement


.sub 'optimize' :method
.annotate 'line', 6415
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6416
# Body
# {
.annotate 'line', 6418
    self.'annotate'(__ARG_1)
.annotate 'line', 6419
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6420
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6421
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6422

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6403
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6405
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.annotate 'line', 6431
# Body
# {
.annotate 'line', 6433
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6434

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.annotate 'line', 6435
# Body
# {
.annotate 'line', 6437
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6438
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6439
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6440

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6429
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
.annotate 'line', 6451
# Body
# {
.annotate 'line', 6453
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6454
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6455
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6456
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6457
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6458
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6460
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6461
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6463

.end # IfStatement


.sub 'optimize' :method
.annotate 'line', 6464
# Body
# {
.annotate 'line', 6466
    self.'optimize_condition'()
.annotate 'line', 6467
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6468
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6469
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 6470
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6472
    getattribute $P1, self, 'truebranch'
    .return($P1)
 __label_3: # case
.annotate 'line', 6474
    getattribute $P2, self, 'falsebranch'
    .return($P2)
 __label_1: # default
 __label_0: # switch end
.annotate 'line', 6476
    .return(self)
# }
.annotate 'line', 6477

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6478
# Body
# {
.annotate 'line', 6480
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6481
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6482
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6483
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6484
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6485
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6486
    $P3 = self.'genlabel'()
    set $S1, $P3
 __label_0: # endif
.annotate 'line', 6487
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 6488
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
 __label_3:
    set $S3, $S1
 __label_2:
.annotate 'line', 6489
    self.'annotate'(__ARG_1)
.annotate 'line', 6490
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6491
    $P1.'emit'(__ARG_1)
.annotate 'line', 6493
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6494
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6495
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6496
    $P2.'emit'(__ARG_1)
# }
 __label_4: # endif
.annotate 'line', 6498
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6499

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6447
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6449
    addattribute $P0, 'truebranch'
.annotate 'line', 6450
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.annotate 'line', 6509
# Body
# {
.annotate 'line', 6511
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6512

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
.annotate 'line', 6513
# Body
# {
.annotate 'line', 6515
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6516
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6518
    self.'annotate'(__ARG_1)
.annotate 'line', 6519
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6520
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6521
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6522
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6523

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6506
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6508
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6532
# Body
# {
.annotate 'line', 6534
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6535
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6536
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6537

.end # WhileStatement


.sub 'optimize' :method
.annotate 'line', 6538
# Body
# {
.annotate 'line', 6540
    self.'optimize_condition'()
.annotate 'line', 6541
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6542
    .return(self)
# }
.annotate 'line', 6543

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6544
# Body
# {
.annotate 'line', 6546
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6548
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 6551
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6554
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
 __label_4:
.annotate 'line', 6555
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 6557
    self.'annotate'(__ARG_1)
.annotate 'line', 6558
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6559
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6560
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6561
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6562
    __ARG_1.'emitlabel'($S1, 'endwhile')
 __label_0: # switch end
# }
.annotate 'line', 6564

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6530
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
.annotate 'line', 6573
# Body
# {
.annotate 'line', 6575
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6576
    self.'parsebody'(__ARG_2)
.annotate 'line', 6577
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6578
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6579

.end # DoStatement


.sub 'optimize' :method
.annotate 'line', 6580
# Body
# {
.annotate 'line', 6582
    self.'optimize_condition'()
.annotate 'line', 6583
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6584
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6585
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
 __label_0: # endif
.annotate 'line', 6586
    setattribute self, 'body', $P1
.annotate 'line', 6587
    .return(self)
# }
.annotate 'line', 6588

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6589
# Body
# {
.annotate 'line', 6591
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6592
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 6593
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6595
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6598
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 6599
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
 __label_4:
.annotate 'line', 6600
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
 __label_5:
.annotate 'line', 6602
    self.'annotate'(__ARG_1)
.annotate 'line', 6603
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6605
    $P1.'emit'(__ARG_1)
.annotate 'line', 6606
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6607
    eq $I1, 2, __label_6
.annotate 'line', 6608
    self.'emit_if'(__ARG_1, $S1, $S2)
 __label_6: # endif
.annotate 'line', 6609
    __ARG_1.'emitlabel'($S2, 'enddo')
 __label_0: # switch end
# }
.annotate 'line', 6611

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6571
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
.annotate 'line', 6620
# Body
# {
.annotate 'line', 6622
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6623
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6624

.end # ContinueStatement


.sub 'optimize' :method
.annotate 'line', 6625
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6626
# Body
# {
.annotate 'line', 6628
    self.'annotate'(__ARG_1)
.annotate 'line', 6629
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6630
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6631

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6618
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6640
# Body
# {
.annotate 'line', 6642
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6643
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6644

.end # BreakStatement


.sub 'optimize' :method
.annotate 'line', 6645
# Body
# {
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6646
# Body
# {
.annotate 'line', 6648
    self.'annotate'(__ARG_1)
.annotate 'line', 6649
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6650
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6651

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6638
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6665
# Body
# {
.annotate 'line', 6667
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6668
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6669
    $P3 = $P1.'isop'('(')
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 6670
    'Expected'("'(' in switch", $P1)
 __label_0: # endif
.annotate 'line', 6671
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P4
.annotate 'line', 6672
    $P1 = __ARG_2.'get'()
.annotate 'line', 6673
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 6674
    'Expected'("')' in switch", $P1)
 __label_1: # endif
.annotate 'line', 6675
    $P1 = __ARG_2.'get'()
.annotate 'line', 6676
    $P3 = $P1.'isop'('{')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 6677
    'Expected'("'{' in switch", $P1)
 __label_2: # endif
.annotate 'line', 6678
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P4
.annotate 'line', 6679
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P4
.annotate 'line', 6680
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P4
 __label_4: # while
.annotate 'line', 6681
    $P1 = __ARG_2.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_5
    $I1 = $P1.'iskeyword'('default')
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 6682
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 6683
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_2, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6684
    $P1 = __ARG_2.'get'()
.annotate 'line', 6685
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_8
.annotate 'line', 6686
    'Expected'("':' in case", $P1)
 __label_8: # endif
.annotate 'line', 6687
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_10: # while
.annotate 'line', 6688
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
.annotate 'line', 6689
    __ARG_2.'unget'($P1)
.annotate 'line', 6690
    $P3 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P2, $P3
# }
    goto __label_10
 __label_9: # endwhile
.annotate 'line', 6692
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6693
    __ARG_2.'unget'($P1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 6696
    $P1 = __ARG_2.'get'()
.annotate 'line', 6697
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_13
.annotate 'line', 6698
    'Expected'("':' in default", $P1)
 __label_13: # endif
 __label_15: # while
.annotate 'line', 6699
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
.annotate 'line', 6700
    __ARG_2.'unget'($P1)
.annotate 'line', 6701
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P3, $P4
# }
    goto __label_15
 __label_14: # endwhile
.annotate 'line', 6703
    __ARG_2.'unget'($P1)
# }
 __label_7: # endif
# }
    goto __label_4
 __label_3: # endwhile
# }
.annotate 'line', 6706

.end # SwitchStatement


.sub 'optimize' :method
.annotate 'line', 6707
# Body
# {
.annotate 'line', 6709
    getattribute $P4, self, 'condition'
    $P3 = $P4.'optimize'()
    setattribute self, 'condition', $P3
.annotate 'line', 6710
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6711
    getattribute $P2, self, 'case_st'
    iter $P5, $P2
    set $P5, 0
 __label_0: # for iteration
    unless $P5 goto __label_1
    shift $P1, $P5
.annotate 'line', 6712
    'optimize_array'($P1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6713
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
.annotate 'line', 6714
    .return(self)
# }
.annotate 'line', 6715

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6716
# Body
# {
.annotate 'line', 6719
# type: $S1
    set $S1, ''
.annotate 'line', 6720
    getattribute $P8, self, 'case_value'
    iter $P9, $P8
    set $P9, 0
 __label_0: # for iteration
    unless $P9 goto __label_1
    shift $P1, $P9
# {
.annotate 'line', 6721
# t: $S2
    $P10 = $P1.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
 __label_2:
.annotate 'line', 6722
    ne $S2, 'N', __label_3
.annotate 'line', 6723
    getattribute $P8, self, 'start'
    'SyntaxError'("Invalid type in case", $P8)
 __label_3: # endif
.annotate 'line', 6724
    ne $S1, '', __label_4
.annotate 'line', 6725
    set $S1, $S2
    goto __label_5
 __label_4: # else
.annotate 'line', 6726
    eq $S1, $S2, __label_6
.annotate 'line', 6727
    set $S1, 'P'
 __label_6: # endif
 __label_5: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6730
# reg: $S3
    $P8 = self.'tempreg'($S1)
    null $S3
    if_null $P8, __label_7
    set $S3, $P8
 __label_7:
.annotate 'line', 6731
    getattribute $P10, self, 'condition'
    $P8 = $P10.'checkresult'()
    set $S9, $P8
    ne $S9, $S1, __label_8
.annotate 'line', 6732
    getattribute $P11, self, 'condition'
    $P11.'emit'(__ARG_1, $S3)
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 6734
# regcond: $S4
    getattribute $P13, self, 'condition'
    $P12 = $P13.'emit_get'(__ARG_1)
    null $S4
    if_null $P12, __label_10
    set $S4, $P12
 __label_10:
.annotate 'line', 6735
    __ARG_1.'emitset'($S3, $S4)
# }
 __label_9: # endif
.annotate 'line', 6739
    self.'genbreaklabel'()
.annotate 'line', 6740
# defaultlabel: $S5
    $P8 = self.'genlabel'()
    null $S5
    if_null $P8, __label_11
    set $S5, $P8
 __label_11:
.annotate 'line', 6741
    new $P2, ['ResizableStringArray']
.annotate 'line', 6742
# regval: $S6
    $P8 = self.'tempreg'($S1)
    null $S6
    if_null $P8, __label_12
    set $S6, $P8
 __label_12:
.annotate 'line', 6743
    getattribute $P8, self, 'case_value'
    iter $P14, $P8
    set $P14, 0
 __label_13: # for iteration
    unless $P14 goto __label_14
    shift $P3, $P14
# {
.annotate 'line', 6744
# label: $S7
    $P10 = self.'genlabel'()
    null $S7
    if_null $P10, __label_15
    set $S7, $P10
 __label_15:
.annotate 'line', 6745
# predefined push
    push $P2, $S7
.annotate 'line', 6746
    $P3.'emit'(__ARG_1, $S6)
.annotate 'line', 6747
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_13
 __label_14: # endfor
.annotate 'line', 6749
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6752
    __ARG_1.'comment'('switch')
.annotate 'line', 6753
    self.'annotate'(__ARG_1)
.annotate 'line', 6754
# var case_st: $P4
    getattribute $P4, self, 'case_st'
.annotate 'line', 6755
# n: $I1
    set $P8, $P4
    set $I1, $P8
# for loop
.annotate 'line', 6756
# i: $I2
    null $I2
 __label_18: # for condition
    ge $I2, $I1, __label_17
# {
.annotate 'line', 6757
# l: $S8
    $S8 = $P2[$I2]
.annotate 'line', 6758
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6759
# var casest: $P5
    $P5 = $P4[$I2]
.annotate 'line', 6760
    iter $P15, $P5
    set $P15, 0
 __label_19: # for iteration
    unless $P15 goto __label_20
    shift $P6, $P15
.annotate 'line', 6761
    $P6.'emit'(__ARG_1)
    goto __label_19
 __label_20: # endfor
# }
 __label_16: # for iteration
.annotate 'line', 6756
    inc $I2
    goto __label_18
 __label_17: # for end
.annotate 'line', 6764
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6765
    getattribute $P8, self, 'default_st'
    iter $P16, $P8
    set $P16, 0
 __label_21: # for iteration
    unless $P16 goto __label_22
    shift $P7, $P16
.annotate 'line', 6766
    $P7.'emit'(__ARG_1)
    goto __label_21
 __label_22: # endfor
.annotate 'line', 6768
    getattribute $P10, self, 'start'
    $P8 = self.'getbreaklabel'($P10)
    __ARG_1.'emitlabel'($P8, 'switch end')
# }
.annotate 'line', 6769

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6658
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6660
    addattribute $P0, 'condition'
.annotate 'line', 6661
    addattribute $P0, 'case_value'
.annotate 'line', 6662
    addattribute $P0, 'case_st'
.annotate 'line', 6663
    addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6781
# Body
# {
.annotate 'line', 6783
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6784
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6785
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6786
    __ARG_2.'unget'($P1)
.annotate 'line', 6787
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
 __label_0: # endif
.annotate 'line', 6789
    $P1 = __ARG_2.'get'()
.annotate 'line', 6790
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6791
    __ARG_2.'unget'($P1)
.annotate 'line', 6792
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6793
    'ExpectOp'(';', __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 6795
    $P1 = __ARG_2.'get'()
.annotate 'line', 6796
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 6797
    __ARG_2.'unget'($P1)
.annotate 'line', 6798
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 6799
    'ExpectOp'(')', __ARG_2)
# }
 __label_2: # endif
.annotate 'line', 6801
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6802

.end # ForStatement


.sub 'optimize' :method
.annotate 'line', 6803
# Body
# {
.annotate 'line', 6805
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 6806
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
 __label_0: # endif
.annotate 'line', 6807
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 6808
    self.'optimize_condition'()
 __label_1: # endif
.annotate 'line', 6809
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 6810
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
 __label_2: # endif
.annotate 'line', 6811
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6812
    .return(self)
# }
.annotate 'line', 6813

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6814
# Body
# {
.annotate 'line', 6816
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 6817
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6818
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 6819
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 6820
    .return()
# }
 __label_0: # endif
.annotate 'line', 6822
    __ARG_1.'comment'('for loop')
.annotate 'line', 6823
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
 __label_3:
.annotate 'line', 6824
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
 __label_4:
.annotate 'line', 6825
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
 __label_5:
.annotate 'line', 6826
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 6827
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6829
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6830
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 6831
    self.'emit_else'(__ARG_1, $S2)
 __label_7: # endif
.annotate 'line', 6833
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6834
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6835
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 6836
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
 __label_8: # endif
.annotate 'line', 6837
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 6839
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6840

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6776
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 6778
    addattribute $P0, 'initializer'
.annotate 'line', 6779
    addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.annotate 'line', 6853
# Body
# {
.annotate 'line', 6855
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6856
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6857
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 6858
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 6859
    self.'createvar'($S1, $S2)
.annotate 'line', 6860
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
 __label_1: # endif
.annotate 'line', 6862
    setattribute self, 'varname', __ARG_4
.annotate 'line', 6863
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 6864
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 6865
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6866

.end # ForeachStatement


.sub 'optimize' :method
.annotate 'line', 6867
# Body
# {
.annotate 'line', 6869
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 6870
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6871
    .return(self)
# }
.annotate 'line', 6872

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6873
# Body
# {
.annotate 'line', 6875
    self.'annotate'(__ARG_1)
.annotate 'line', 6876
# regcont: $S1
    null $S1
.annotate 'line', 6877
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 6878
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 6879
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6880
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 6883
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 6884
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 6885
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 6886
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
 __label_4:
.annotate 'line', 6887
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
 __label_5:
.annotate 'line', 6888
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 6889
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 6890
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6891
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6892
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 6893
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 6894
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 6895
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6896

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6847
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 6849
    addattribute $P0, 'deftype'
.annotate 'line', 6850
    addattribute $P0, 'varname'
.annotate 'line', 6851
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6901
# Body
# {
.annotate 'line', 6903
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 6904
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6905
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 6906
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 6907
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6909
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 6910
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 6911
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 6912
    __ARG_2.'unget'($P3)
.annotate 'line', 6913
    __ARG_2.'unget'($P2)
.annotate 'line', 6914
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
.annotate 'line', 6916
    new $P5, [ 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 6917

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6927
# Body
# {
.annotate 'line', 6929
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6930
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 6931

.end # ThrowStatement


.sub 'optimize' :method
.annotate 'line', 6932
# Body
# {
.annotate 'line', 6934
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 6935
    .return(self)
# }
.annotate 'line', 6936

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 6937
# Body
# {
.annotate 'line', 6939
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 6940
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 6941
    self.'annotate'(__ARG_1)
.annotate 'line', 6942
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 6944
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_1 # break
 __label_4: # case
.annotate 'line', 6947
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_1 # break
 __label_2: # default
.annotate 'line', 6950
    getattribute $P3, self, 'start'
    'SyntaxError'("Invalid throw argument", $P3)
 __label_1: # switch end
# }
.annotate 'line', 6952

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6923
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6925
    addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 6966
# Body
# {
.annotate 'line', 6968
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6969
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6970
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 6971
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 6974
    __ARG_2.'unget'($P1)
 __label_1: # endif
.annotate 'line', 6976
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 6977
    $P1 = __ARG_2.'get'()
.annotate 'line', 6978
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 6979
    'ExpectedOp'('catch', $P1)
 __label_2: # endif
.annotate 'line', 6980
    $P1 = __ARG_2.'get'()
.annotate 'line', 6981
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 6982
    'Expected'("'(' after 'catch'", $P1)
 __label_3: # endif
.annotate 'line', 6983
    $P1 = __ARG_2.'get'()
.annotate 'line', 6984
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 6985
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
 __label_5:
.annotate 'line', 6986
    setattribute self, 'exname', $P1
.annotate 'line', 6987
    self.'createvar'($S1, 'P')
.annotate 'line', 6988
    $P1 = __ARG_2.'get'()
.annotate 'line', 6989
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 6990
    'Expected'("')' in 'catch'", $P1)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 6992
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 6993

.end # TryStatement


.sub 'optimize' :method
.annotate 'line', 6994
# Body
# {
.annotate 'line', 6996
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 6997
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
 __label_0: # endif
.annotate 'line', 6998
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 6999
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7000
    .return(self)
# }
.annotate 'line', 7001

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7002
# Body
# {
.annotate 'line', 7004
# reghandler: $S1
    $P7 = self.'tempreg'('P')
    null $S1
    if_null $P7, __label_0
    set $S1, $P7
 __label_0:
.annotate 'line', 7005
# labelhandler: $S2
    $P7 = self.'genlabel'()
    null $S2
    if_null $P7, __label_1
    set $S2, $P7
 __label_1:
.annotate 'line', 7006
# labelpasthandler: $S3
    $P7 = self.'genlabel'()
    null $S3
    if_null $P7, __label_2
    set $S3, $P7
 __label_2:
.annotate 'line', 7007
# exreg: $S4
    null $S4
.annotate 'line', 7008
    getattribute $P7, self, 'exname'
    if_null $P7, __label_3
# {
.annotate 'line', 7009
# var exname: $P1
    getattribute $P8, self, 'exname'
    $P1 = self.'getvar'($P8)
.annotate 'line', 7010
    $P7 = $P1.'getreg'()
    set $S4, $P7
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 7013
    $P7 = self.'tempreg'('P')
    set $S4, $P7
 __label_4: # endif
.annotate 'line', 7015
    self.'annotate'(__ARG_1)
.annotate 'line', 7016
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7018
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7019
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7021
    getattribute $P7, self, 'modifiers'
    if_null $P7, __label_5
# {
.annotate 'line', 7022
# var modiflist: $P2
    getattribute $P8, self, 'modifiers'
    $P2 = $P8.'getlist'()
.annotate 'line', 7023
    iter $P9, $P2
    set $P9, 0
 __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P3, $P9
# {
.annotate 'line', 7024
# modifname: $S5
    $P7 = $P3.'getname'()
    null $S5
    if_null $P7, __label_8
    set $S5, $P7
 __label_8:
.annotate 'line', 7025
# nargs: $I1
    $P7 = $P3.'numargs'()
    set $I1, $P7
.annotate 'line', 7026
    set $S7, $S5
    set $S8, 'min_severity'
    if $S7 == $S8 goto __label_11
    set $S8, 'max_severity'
    if $S7 == $S8 goto __label_12
    set $S8, 'handle_types'
    if $S7 == $S8 goto __label_13
    set $S8, 'handle_types_except'
    if $S7 == $S8 goto __label_14
    goto __label_10
# switch
 __label_11: # case
 __label_12: # case
.annotate 'line', 7029
    eq $I1, 1, __label_15
.annotate 'line', 7030
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
 __label_15: # endif
.annotate 'line', 7031
# var arg: $P4
    $P4 = $P3.'getarg'(0)
.annotate 'line', 7032
# argreg: $S6
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S6
    if_null $P8, __label_16
    set $S6, $P8
 __label_16:
.annotate 'line', 7033
    __ARG_1.'say'('    ', $S1, ".'", $S5, "'(", $S6, ")")
    goto __label_9 # break
 __label_13: # case
 __label_14: # case
.annotate 'line', 7037
    new $P5, ['ResizableStringArray']
# for loop
.annotate 'line', 7038
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 7039
# var arg: $P6
    $P6 = $P3.'getarg'($I2)
.annotate 'line', 7040
    $P7 = $P6.'emit_get'(__ARG_1)
# predefined push
    push $P5, $P7
# }
 __label_17: # for iteration
.annotate 'line', 7038
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 7043
# predefined join
    join $S7, ', ', $P5
.annotate 'line', 7042
    __ARG_1.'say'('    ', $S1, ".'", $S5, "'(", $S7, ")")
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 7046
    getattribute $P7, self, 'start'
    'SyntaxError'('Unexpected modifier in try', $P7)
 __label_9: # switch end
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 7051
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7052
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7053
    getattribute $P7, self, 'stry'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7054
    __ARG_1.'comment'('try: end')
.annotate 'line', 7055
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7057
    self.'annotate'(__ARG_1)
.annotate 'line', 7058
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7060
    __ARG_1.'comment'('catch')
.annotate 'line', 7061
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7062
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7063
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7064
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7065
    getattribute $P7, self, 'scatch'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7067
    __ARG_1.'comment'('catch end')
.annotate 'line', 7068
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7069

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 6959
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 6961
    addattribute $P0, 'stry'
.annotate 'line', 6962
    addattribute $P0, 'modifiers'
.annotate 'line', 6963
    addattribute $P0, 'exname'
.annotate 'line', 6964
    addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.annotate 'line', 7080
# Body
# {
.annotate 'line', 7082
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7083
    setattribute self, 'name', __ARG_3
.annotate 'line', 7084
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7085
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7086

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7076
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7078
    addattribute $P0, 'name'
.annotate 'line', 7079
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.annotate 'line', 7099
# Body
# {
.annotate 'line', 7101
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7102
    setattribute self, 'name', __ARG_3
.annotate 'line', 7103
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7104

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7093
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7095
    addattribute $P0, 'name'
.annotate 'line', 7096
    addattribute $P0, 'basetype'
.annotate 'line', 7097
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.annotate 'line', 7113
# Body
# {
.annotate 'line', 7115
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7116
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7117
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7118
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7119
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7121
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7124
    __ARG_5.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 7125

.end # DeclareSingleStatement


.sub 'optimize' :method
.annotate 'line', 7126
# Body
# {
.annotate 'line', 7128
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7129
    if_null $P1, __label_0
.annotate 'line', 7130
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7131
    .return(self)
# }
.annotate 'line', 7132

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7133
# Body
# {
.annotate 'line', 7135
    self.'annotate'(__ARG_1)
.annotate 'line', 7136
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7137
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7138
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7139
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7140
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7142
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7143
    __ARG_1.'emitnull'($S2)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7145
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
 __label_6:
.annotate 'line', 7146
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7147
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, 'ConcatString'
 __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7148
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
.annotate 'line', 7150
    $P1.'emit'(__ARG_1, $S2)
 __label_10: # endif
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7153
    isa $I1, $P1, 'IndexExpr'
    unless $I1 goto __label_12
# {
.annotate 'line', 7155
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 7158
# ireg: $S5
    null $S5
.annotate 'line', 7159
    ne $S4, '', __label_14
.annotate 'line', 7160
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
 __label_14: # else
# {
.annotate 'line', 7162
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7163
    $P1.'emit'(__ARG_1, $S5)
# }
 __label_15: # endif
.annotate 'line', 7165
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
 __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7166
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
 __label_19:
.annotate 'line', 7167
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7168
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7169
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7170
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
 __label_16: # else
.annotate 'line', 7173
    __ARG_1.'emitset'($S2, $S5)
 __label_17: # endif
# }
 __label_13: # endif
# }
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 7177

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7109
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7111
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
.annotate 'line', 7188
# Body
# {
.annotate 'line', 7192
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7193
    box $P4, __ARG_5
    setattribute self, 'arraytype', $P4
.annotate 'line', 7194
# var vdata: $P1
    getattribute $P4, self, 'name'
    $P1 = self.'createvar'($P4, 'P')
.annotate 'line', 7195
    $P5 = $P1.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 7196
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7197
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_0
# {
.annotate 'line', 7199
    __ARG_6.'unget'($P2)
.annotate 'line', 7200
    $P5 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P5
.annotate 'line', 7201
    'ExpectOp'(']', __ARG_6)
# }
 __label_0: # endif
.annotate 'line', 7203
    $P2 = __ARG_6.'get'()
.annotate 'line', 7204
    $P4 = $P2.'isop'('=')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7205
    $P2 = __ARG_6.'get'()
.annotate 'line', 7206
    $P4 = $P2.'isop'('[')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 7207
    'Expected'("array initializer", $P2)
 __label_3: # endif
.annotate 'line', 7208
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P5
.annotate 'line', 7209
    $P2 = __ARG_6.'get'()
.annotate 'line', 7210
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_4
# {
.annotate 'line', 7211
    __ARG_6.'unget'($P2)
 __label_5: # do
.annotate 'line', 7212
# {
.annotate 'line', 7213
# var item: $P3
    $P3 = 'parseExpr'(__ARG_6, self)
.annotate 'line', 7214
    getattribute $P4, self, 'initarray'
# predefined push
    push $P4, $P3
# }
 __label_7: # continue
.annotate 'line', 7215
    $P2 = __ARG_6.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 7216
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_8
.annotate 'line', 7217
    'Expected'("',' or ']'", $P2)
 __label_8: # endif
# }
 __label_4: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 7221
    __ARG_6.'unget'($P2)
 __label_2: # endif
# }
.annotate 'line', 7222

.end # DeclareArrayStatement


.sub 'optimize' :method
.annotate 'line', 7223
# Body
# {
.annotate 'line', 7225
    getattribute $P1, self, 'size'
    if_null $P1, __label_0
.annotate 'line', 7226
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
 __label_0: # endif
.annotate 'line', 7227
    getattribute $P1, self, 'initarray'
    'optimize_array'($P1)
.annotate 'line', 7228
    .return(self)
# }
.annotate 'line', 7229

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7230
# Body
# {
.annotate 'line', 7232
    self.'annotate'(__ARG_1)
.annotate 'line', 7234
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7235
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7236
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7237
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7238
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7239
    if_null $P2, __label_0
# {
.annotate 'line', 7241
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
 __label_2:
.annotate 'line', 7242
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7246
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
 __label_1: # endif
.annotate 'line', 7248
    if_null $P3, __label_3
# {
.annotate 'line', 7249
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
 __label_4:
.annotate 'line', 7250
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7251
    unless_null $P2, __label_5
# {
.annotate 'line', 7252
    le $I1, 0, __label_6
# {
.annotate 'line', 7254
    __ARG_1.'emitset'($P1, $I1)
# }
 __label_6: # endif
# }
 __label_5: # endif
.annotate 'line', 7257
# i: $I2
    null $I2
.annotate 'line', 7258
    iter $P7, $P3
    set $P7, 0
 __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7259
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7260
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7261
    inc $I2
# }
    goto __label_7
 __label_8: # endfor
# }
 __label_3: # endif
# }
.annotate 'line', 7264

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7182
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7184
    addattribute $P0, 'size'
.annotate 'line', 7185
    addattribute $P0, 'initarray'
.annotate 'line', 7186
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 7269
# Body
# {
.annotate 'line', 7271
# var next: $P1
    null $P1
.annotate 'line', 7272
# var r: $P2
    null $P2
 __label_0: # do
.annotate 'line', 7273
# {
.annotate 'line', 7274
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7275
    'RequireIdentifier'($P3)
.annotate 'line', 7276
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7277
# var item: $P5
    null $P5
.annotate 'line', 7278
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7279
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7281
    __ARG_4.'unget'($P4)
.annotate 'line', 7282
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
 __label_4: # endif
.annotate 'line', 7284
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7285
    $P1 = __ARG_4.'get'()
# }
 __label_2: # continue
.annotate 'line', 7286
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
 __label_1: # enddo
.annotate 'line', 7287
    'RequireOp'(';', $P1)
.annotate 'line', 7288
    .return($P2)
# }
.annotate 'line', 7289

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7295
# Body
# {
.annotate 'line', 7297
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7298

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7293
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7303
# Body
# {
.annotate 'line', 7305
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7306

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7301
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7310
# Body
# {
.annotate 'line', 7312
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7313

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7315
# Body
# {
.annotate 'line', 7317
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7318

.end # newIntArray


.sub 'parseInt'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7320
# Body
# {
.annotate 'line', 7322
.const 'Sub' $P1 = 'newIntSingle'
.annotate 'line', 7323
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7324
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7325

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7331
# Body
# {
.annotate 'line', 7333
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7334

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7329
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7339
# Body
# {
.annotate 'line', 7341
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7342

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7337
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7346
# Body
# {
.annotate 'line', 7348
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7349

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7351
# Body
# {
.annotate 'line', 7353
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7354

.end # newFloatArray


.sub 'parseFloat'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7356
# Body
# {
.annotate 'line', 7358
.const 'Sub' $P1 = 'newFloatSingle'
.annotate 'line', 7359
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7360
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7361

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7367
# Body
# {
.annotate 'line', 7369
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7370

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7365
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7375
# Body
# {
.annotate 'line', 7377
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7378

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7373
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7382
# Body
# {
.annotate 'line', 7384
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7385

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7387
# Body
# {
.annotate 'line', 7389
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7390

.end # newStringArray


.sub 'parseString'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7392
# Body
# {
.annotate 'line', 7394
.const 'Sub' $P1 = 'newStringSingle'
.annotate 'line', 7395
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7396
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7397

.end # parseString

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.annotate 'line', 7409
# Body
# {
.annotate 'line', 7412
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7413
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7414
    setattribute self, 'name', __ARG_4
.annotate 'line', 7415
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7416

.end # ConstStatement


.sub 'optimize' :method
.annotate 'line', 7417
# Body
# {
.annotate 'line', 7419
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7420
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7421
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 7422
    $P1 = $P1.'optimize'()
.annotate 'line', 7423
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7425
    getattribute $P4, self, 'start'
.annotate 'line', 7424
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
 __label_1: # endif
.annotate 'line', 7427
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7428
    setattribute self, 'value', $P1
.annotate 'line', 7429
    .return(self)
# }
.annotate 'line', 7430

.end # optimize


.sub 'checkresult' :method
.annotate 'line', 7431
# Body
# {
.annotate 'line', 7433
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7434

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7435
# Body
# {
.annotate 'line', 7437
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7438
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7439

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7403
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7405
    addattribute $P0, 'type'
.annotate 'line', 7406
    addattribute $P0, 'name'
.annotate 'line', 7407
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7442
# Body
# {
.annotate 'line', 7444
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7445
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 7446
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
 __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7447
    'SyntaxError'('Invalid type for const', __ARG_1)
 __label_1: # endif
.annotate 'line', 7449
# var multi: $P2
    null $P2
 __label_4: # do
.annotate 'line', 7450
# {
.annotate 'line', 7451
    $P1 = __ARG_2.'get'()
.annotate 'line', 7452
# var name: $P3
    set $P3, $P1
.annotate 'line', 7453
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7454
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7456
    new $P6, [ 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7455
    $P2 = 'addtomulti'($P2, $P5)
# }
 __label_6: # continue
.annotate 'line', 7457
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
 __label_5: # enddo
.annotate 'line', 7458
    .return($P2)
# }
.annotate 'line', 7459

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.annotate 'line', 7468
# Body
# {
.annotate 'line', 7470
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7471
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7472
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7473
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7474
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 7476
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7477

.end # VarStatement


.sub 'optimize_init' :method
.annotate 'line', 7478
# Body
# {
.annotate 'line', 7480
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7481
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7482
    .return(self)
# }
.annotate 'line', 7483

.end # optimize_init


.sub 'optimize' :method
.annotate 'line', 7484
# Body
# {
.annotate 'line', 7486
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7487

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7488
# Body
# {
.annotate 'line', 7490
    self.'annotate'(__ARG_1)
.annotate 'line', 7491
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7492
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7493
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7494
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7495
    if_null $P1, __label_2
.annotate 'line', 7496
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7497
    null $P1
 __label_3: # endif
 __label_2: # endif
.annotate 'line', 7498
    if_null $P1, __label_4
# {
.annotate 'line', 7499
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 7500
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
.annotate 'line', 7502
    isa $I1, $P1, 'MemberExpr'
    if $I1 goto __label_17
    isa $I1, $P1, 'ArrayExpr'
 __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, 'NewExpr'
 __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7503
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
 __label_14: # else
.annotate 'line', 7505
    $P1.'emit'(__ARG_1, $S2)
 __label_15: # endif
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
 __label_12: # case
.annotate 'line', 7510
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
 __label_18:
.annotate 'line', 7511
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
 __label_13: # case
.annotate 'line', 7514
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
 __label_8: # default
.annotate 'line', 7516
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
 __label_7: # switch end
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 7520
    __ARG_1.'emitnull'($S2)
 __label_5: # endif
# }
.annotate 'line', 7521

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7465
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7467
    addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7526
# Body
# {
.annotate 'line', 7528
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7529
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7530

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7531
# Body
# {
.annotate 'line', 7533
    self.'annotate'(__ARG_1)
.annotate 'line', 7534
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7535
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7536
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7537
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7538

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7524
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.annotate 'line', 7545
# Body
# {
.annotate 'line', 7547
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7548
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7549
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7550
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7551

.end # FixedVarStatement


.sub 'optimize' :method
.annotate 'line', 7552
# Body
# {
.annotate 'line', 7554
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7555
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7556

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7557
# Body
# {
.annotate 'line', 7559
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7560
    self.'annotate'(__ARG_1)
.annotate 'line', 7561
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7562
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 7563
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7564
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7565

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7541
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7543
    addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.annotate 'line', 7568
# Body
# {
.annotate 'line', 7570
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7571
    'RequireIdentifier'($P1)
.annotate 'line', 7572
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7573
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7574
    $P2 = __ARG_2.'get'()
.annotate 'line', 7575
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7576
    new $P5, [ 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 7578
    __ARG_2.'unget'($P2)
.annotate 'line', 7579
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
.annotate 'line', 7583
    __ARG_2.'unget'($P2)
.annotate 'line', 7584
    new $P4, [ 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 7586

.end # parseVar


.sub 'parseVolatile'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7588
# Body
# {
.annotate 'line', 7590
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7591
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7592
    'SyntaxError'("invalid volatile type", $P1)
 __label_0: # endif
.annotate 'line', 7593
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7594

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 7605
# Body
# {
.annotate 'line', 7607
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7608
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7609
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7610
# var t: $P1
    null $P1
 __label_1: # while
.annotate 'line', 7611
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7612
    __ARG_2.'unget'($P1)
.annotate 'line', 7613
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7614
    unless_null $P2, __label_2
.annotate 'line', 7615
    'InternalError'('Unexpected null statement')
 __label_2: # endif
.annotate 'line', 7616
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 7618
    setattribute self, 'end', $P1
# }
.annotate 'line', 7619

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
.annotate 'line', 7620
# Body
# {
.annotate 'line', 7622
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7623
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7624
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7625
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7626
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
 __label_1: # endif
.annotate 'line', 7627
    .return($S2)
# }
.annotate 'line', 7628

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.annotate 'line', 7629
# Body
# {
.annotate 'line', 7631
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7632
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7633
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7634
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7635
    'SyntaxError'('Label already defined', __ARG_1)
 __label_1: # endif
.annotate 'line', 7636
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7637
    $P1[$S1] = $S3
.annotate 'line', 7638
    .return($S3)
# }
.annotate 'line', 7639

.end # createlabel


.sub 'getend' :method
.annotate 'line', 7640
# Body
# {
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7641
# Body
# {
.annotate 'line', 7643
    __ARG_1.'comment'('{')
.annotate 'line', 7644
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7645
    $P1.'emit'(__ARG_1)
.annotate 'line', 7646
    self.'freetemps'()
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7648
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7649

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7600
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7602
    addattribute $P0, 'end'
.annotate 'line', 7603
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
.annotate 'line', 7662
# Body
# {
.annotate 'line', 7664
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7666
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7667
    new $P1, ['ResizableStringArray']
.annotate 'line', 7668
    new $P2, ['ResizableStringArray']
.annotate 'line', 7669
    setattribute self, 'tempreg', $P1
.annotate 'line', 7670
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7671

.end # RegisterStore


.sub 'createreg' :method
.annotate 'line', 7672
# Body
# {
.annotate 'line', 7674
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7675
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7676
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7677
    assign $P1, $I1
.annotate 'line', 7678
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
 __label_0:
.annotate 'line', 7679
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7680
    .return($S1)
# }
.annotate 'line', 7681

.end # createreg


.sub 'tempreg' :method
.annotate 'line', 7682
# Body
# {
.annotate 'line', 7684
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7685
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7686
# reg: $S1
    null $S1
.annotate 'line', 7687
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7688
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7690
    $P4 = self.'createreg'()
    set $S1, $P4
 __label_1: # endif
.annotate 'line', 7691
# predefined push
    push $P2, $S1
.annotate 'line', 7692
    .return($S1)
# }
.annotate 'line', 7693

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 7694
# Body
# {
.annotate 'line', 7696
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7697
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7698
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7699
# i: $I2
    sub $I2, $I1, 1
 __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7700
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7701
# predefined push
    push $P1, $S1
# }
 __label_0: # for iteration
.annotate 'line', 7699
    dec $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 7703
    assign $P2, 0
# }
.annotate 'line', 7704

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7658
    addattribute $P0, 'type'
.annotate 'line', 7659
    addattribute $P0, 'nreg'
.annotate 'line', 7660
    addattribute $P0, 'tempreg'
.annotate 'line', 7661
    addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 7728
# Body
# {
.annotate 'line', 7730
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7731
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 7732
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 7733
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 7734
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 7735
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 7736
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 7737

.end # FunctionBase


.sub 'getouter' :method
.annotate 'line', 7739
# Body
# {
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
.annotate 'line', 7740
# Body
# {
.annotate 'line', 7743
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 7744
    unless_null $P1, __label_0
# {
.annotate 'line', 7745
    $P1 = self.'generatesubid'()
.annotate 'line', 7746
    setattribute self, 'subid', $P1
# }
 __label_0: # endif
.annotate 'line', 7748
    .return($P1)
# }
.annotate 'line', 7749

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
.annotate 'line', 7751
# Body
# {
.annotate 'line', 7753
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 7754
    .return($I1)
# }
.annotate 'line', 7755

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.annotate 'line', 7756
# Body
# {
.annotate 'line', 7758
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 7759
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 7760
    $P5 = $P2.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 7761
    __ARG_1.'unget'($P2)
 __label_1: # do
.annotate 'line', 7762
# {
.annotate 'line', 7763
    $P2 = __ARG_1.'get'()
.annotate 'line', 7764
# type: $S1
    $P6 = $P2.'checkkeyword'()
    $P5 = 'typetoregcheck'($P6)
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
 __label_4:
.annotate 'line', 7765
    eq $S1, '', __label_5
.annotate 'line', 7766
    $P2 = __ARG_1.'get'()
    goto __label_6
 __label_5: # else
.annotate 'line', 7768
    set $S1, 'P'
 __label_6: # endif
.annotate 'line', 7769
# argname: $S2
# predefined string
    $P5 = self.'getparamnum'()
    set $S4, $P5
    concat $S2, '__ARG_', $S4
.annotate 'line', 7770
    self.'createvarnamed'($P2, $S1, $S2)
.annotate 'line', 7772
# varname: $S3
    set $P5, $P2
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
 __label_7:
.annotate 'line', 7773
# var arg: $P3
    root_new $P3, ['parrot';'Hash']
.annotate 'line', 7774
    $P3['name'] = $S3
.annotate 'line', 7775
    $P2 = __ARG_1.'get'()
.annotate 'line', 7776
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 7777
# var modifiers: $P4
    new $P4, [ 'ModifierList' ]
    $P4.'ModifierList'(__ARG_1, self)
.annotate 'line', 7778
    $P3['modifiers'] = $P4
.annotate 'line', 7779
    $P2 = __ARG_1.'get'()
# }
 __label_8: # endif
.annotate 'line', 7781
# predefined push
    push $P1, $P3
# }
 __label_3: # continue
.annotate 'line', 7782
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 7783
    $P5 = $P2.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_9
.annotate 'line', 7784
    'Expected'("')' or ','", $P2)
 __label_9: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 7786

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
.annotate 'line', 7788
# Body
# {
.annotate 'line', 7790
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 7791
    unless_null $P1, __label_0
.annotate 'line', 7792
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7794
# predefined push
    push $P1, __ARG_1
 __label_1: # endif
# }
.annotate 'line', 7795

.end # addlocalfunction


.sub 'optimize' :method
.annotate 'line', 7797
# Body
# {
.annotate 'line', 7799
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7800
    .return(self)
# }
.annotate 'line', 7801

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 7803
# Body
# {
.annotate 'line', 7805
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7806
    unless_null $P1, __label_0
# {
.annotate 'line', 7807
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 7808
    setattribute self, 'usedlexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 7810
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7811

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
.annotate 'line', 7812
# Body
# {
.annotate 'line', 7814
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 7815
    unless_null $P1, __label_0
# {
.annotate 'line', 7816
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 7817
    setattribute self, 'lexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 7819
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7820

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
.annotate 'line', 7821
# Body
# {
.annotate 'line', 7825
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 7826
# lexname: $S1
    null $S1
.annotate 'line', 7827
    if_null $P1, __label_0
.annotate 'line', 7828
    set $S1, $P1
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7830
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 7831
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 7832
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 7833
    self.'setlex'($S1, $S2)
.annotate 'line', 7834
    __ARG_1.'setlex'($S1)
# }
 __label_1: # endif
.annotate 'line', 7836
    .return($S1)
# }
.annotate 'line', 7837

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.annotate 'line', 7839
# Body
# {
.annotate 'line', 7841
# var store: $P1
    null $P1
.annotate 'line', 7842
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
.annotate 'line', 7844
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 7846
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 7848
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 7850
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 7852
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 7854
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 7855
    .return($S1)
# }
.annotate 'line', 7856

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.annotate 'line', 7857
# Body
# {
.annotate 'line', 7859
# var store: $P1
    null $P1
.annotate 'line', 7860
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
.annotate 'line', 7862
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 7864
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 7866
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 7868
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 7870
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 7872
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 7873
    .return($S1)
# }
.annotate 'line', 7874

.end # tempreg


.sub 'freetemps' :method
.annotate 'line', 7875
# Body
# {
.annotate 'line', 7877
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
.annotate 'line', 7878
    $P1.'freetemps'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 7879

.end # freetemps


.sub 'genlabel' :method
.annotate 'line', 7880
# Body
# {
.annotate 'line', 7882
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 7883
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7884
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 7885
    assign $P1, $I1
.annotate 'line', 7886
    .return($S1)
# }
.annotate 'line', 7887

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.annotate 'line', 7888
# Body
# {
.annotate 'line', 7890
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 7891

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.annotate 'line', 7892
# Body
# {
.annotate 'line', 7894
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 7895

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 7897
# Body
# {
.annotate 'line', 7899
# name: $S1
    getattribute $P20, self, 'name'
    null $S1
    if_null $P20, __label_0
    set $S1, $P20
 __label_0:
.annotate 'line', 7900
    __ARG_1.'say'()
.annotate 'line', 7901
    __ARG_1.'print'(".sub ")
.annotate 'line', 7902
    $P20 = self.'isanonymous'()
    if_null $P20, __label_1
    unless $P20 goto __label_1
.annotate 'line', 7903
    __ARG_1.'print'("'' :anon")
    goto __label_2
 __label_1: # else
.annotate 'line', 7905
    __ARG_1.'print'("'", $S1, "'")
 __label_2: # endif
.annotate 'line', 7906
    getattribute $P20, self, 'subid'
    if_null $P20, __label_3
.annotate 'line', 7907
    getattribute $P21, self, 'subid'
    __ARG_1.'print'(" :subid('", $P21, "')")
 __label_3: # endif
.annotate 'line', 7908
    getattribute $P20, self, 'outer'
    if_null $P20, __label_4
# {
.annotate 'line', 7909
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 7910
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 7911
    if_null $P2, __label_5
.annotate 'line', 7912
    __ARG_1.'print'(" :outer('", $P2, "')")
 __label_5: # endif
# }
 __label_4: # endif
.annotate 'line', 7916
    $P20 = self.'ismethod'()
    if_null $P20, __label_6
    unless $P20 goto __label_6
.annotate 'line', 7917
    __ARG_1.'print'(' :method')
 __label_6: # endif
.annotate 'line', 7918
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 7919
    if_null $P3, __label_7
# {
.annotate 'line', 7920
# var mlist: $P4
    $P4 = $P3.'getlist'()
.annotate 'line', 7921
    iter $P22, $P4
    set $P22, 0
 __label_9: # for iteration
    unless $P22 goto __label_10
    shift $P5, $P22
# {
.annotate 'line', 7922
# nargmods: $I1
    $P20 = $P5.'numargs'()
    set $I1, $P20
.annotate 'line', 7923
    $P20 = $P5.'getname'()
    __ARG_1.'print'(' :', $P20)
.annotate 'line', 7924
    le $I1, 0, __label_11
# {
.annotate 'line', 7925
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 7926
# iargmod: $I2
    null $I2
 __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7927
# var argmod: $P6
    $P6 = $P5.'getarg'($I2)
.annotate 'line', 7928
    $P20 = $P6.'isstringliteral'()
    isfalse $I5, $P20
    unless $I5 goto __label_15
.annotate 'line', 7929
    getattribute $P21, $P6, 'start'
    'SyntaxError'('Invalid modifier', $P21)
 __label_15: # endif
.annotate 'line', 7930
    $P20 = $P6.'getPirString'()
    __ARG_1.'print'($P20)
# }
 __label_12: # for iteration
.annotate 'line', 7926
    inc $I2
    goto __label_14
 __label_13: # for end
.annotate 'line', 7932
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
.annotate 'line', 7937
    ne $S1, 'main', __label_16
.annotate 'line', 7938
    __ARG_1.'print'(' :main')
 __label_16: # endif
# }
 __label_8: # endif
.annotate 'line', 7940
    __ARG_1.'say'()
.annotate 'line', 7942
# var params: $P7
    getattribute $P7, self, 'params'
.annotate 'line', 7943
# var param: $P8
    null $P8
.annotate 'line', 7944
# paramname: $S2
    null $S2
.annotate 'line', 7945
# var a: $P9
    null $P9
.annotate 'line', 7947
    iter $P23, $P7
    set $P23, 0
 __label_17: # for iteration
    unless $P23 goto __label_18
    shift $P8, $P23
# {
.annotate 'line', 7948
    $S2 = $P8['name']
.annotate 'line', 7949
    $P9 = self.'getvar'($S2)
.annotate 'line', 7950
# ptype: $S3
    $P21 = $P9.'gettype'()
    $P20 = 'typetopirname'($P21)
    null $S3
    if_null $P20, __label_19
    set $S3, $P20
 __label_19:
.annotate 'line', 7951
    $P20 = $P9.'getreg'()
    __ARG_1.'print'('        .param ', $S3, ' ', $P20)
.annotate 'line', 7952
# var modarg: $P10
    $P10 = $P8['modifiers']
.annotate 'line', 7953
    if_null $P10, __label_20
# {
.annotate 'line', 7954
# var named: $P11
    null $P11
.annotate 'line', 7955
# var slurpy: $P12
    null $P12
.annotate 'line', 7956
# var modarglist: $P13
    $P13 = $P10.'getlist'()
.annotate 'line', 7957
    iter $P24, $P13
    set $P24, 0
 __label_21: # for iteration
    unless $P24 goto __label_22
    shift $P14, $P24
# {
.annotate 'line', 7958
# modname: $S4
    $P20 = $P14.'getname'()
    null $S4
    if_null $P20, __label_23
    set $S4, $P20
 __label_23:
.annotate 'line', 7959
    set $S8, $S4
    set $S9, 'named'
    if $S8 == $S9 goto __label_26
    set $S9, 'slurpy'
    if $S8 == $S9 goto __label_27
    goto __label_25
# switch
 __label_26: # case
.annotate 'line', 7961
    set $P11, $P14
    goto __label_24 # break
 __label_27: # case
.annotate 'line', 7964
    set $P12, $P14
    goto __label_24 # break
 __label_25: # default
.annotate 'line', 7967
    __ARG_1.'print'(' :', $S4)
 __label_24: # switch end
# }
    goto __label_21
 __label_22: # endfor
.annotate 'line', 7970
    isnull $I5, $P11
    not $I5
    unless $I5 goto __label_30
    isnull $I5, $P12
    not $I5
 __label_30:
    unless $I5 goto __label_28
# {
.annotate 'line', 7975
    __ARG_1.'print'(" :named :slurpy")
# }
    goto __label_29
 __label_28: # else
# {
.annotate 'line', 7978
    if_null $P11, __label_31
# {
.annotate 'line', 7979
# setname: $S5
    null $S5
.annotate 'line', 7980
# nargs: $I3
    $P20 = $P11.'numargs'()
    set $I3, $P20
.annotate 'line', 7981
    set $I5, $I3
    null $I6
    if $I5 == $I6 goto __label_35
    set $I6, 1
    if $I5 == $I6 goto __label_36
    goto __label_34
# switch
 __label_35: # case
.annotate 'line', 7983
    concat $S0, "'", $S2
    concat $S0, $S0, "'"
    set $S5, $S0
    goto __label_33 # break
 __label_36: # case
.annotate 'line', 7986
# var argmod: $P15
    $P15 = $P11.'getarg'(0)
.annotate 'line', 7987
    $P20 = $P15.'isstringliteral'()
    isfalse $I7, $P20
    unless $I7 goto __label_37
.annotate 'line', 7988
    getattribute $P21, self, 'start'
    'SyntaxError'('Invalid modifier', $P21)
 __label_37: # endif
.annotate 'line', 7989
    $P25 = $P15.'getPirString'()
    set $S5, $P25
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 7992
    getattribute $P26, self, 'start'
    'SyntaxError'('Invalid modifier', $P26)
 __label_33: # switch end
.annotate 'line', 7994
    __ARG_1.'print'(" :named(", $S5, ")")
# }
    goto __label_32
 __label_31: # else
.annotate 'line', 7996
    if_null $P12, __label_38
# {
.annotate 'line', 7997
    __ARG_1.'print'(" :slurpy")
# }
 __label_38: # endif
 __label_32: # endif
# }
 __label_29: # endif
# }
 __label_20: # endif
.annotate 'line', 8001
    __ARG_1.'say'('')
# }
    goto __label_17
 __label_18: # endfor
.annotate 'line', 8003
    getattribute $P20, self, 'start'
    __ARG_1.'annotate'($P20)
.annotate 'line', 8006
# var lexicals: $P16
    getattribute $P16, self, 'lexicals'
.annotate 'line', 8007
    if_null $P16, __label_39
# {
.annotate 'line', 8009
    iter $P27, $P16
    set $P27, 0
 __label_40: # for iteration
    unless $P27 goto __label_41
    shift $S6, $P27
.annotate 'line', 8010
    $P20 = $P16[$S6]
    __ARG_1.'say'(".lex '", $P20, "', ", $S6)
    goto __label_40
 __label_41: # endfor
# }
 __label_39: # endif
.annotate 'line', 8013
    getattribute $P16, self, 'usedlexicals'
.annotate 'line', 8014
    if_null $P16, __label_42
# {
.annotate 'line', 8016
    iter $P28, $P16
    set $P28, 0
 __label_43: # for iteration
    unless $P28 goto __label_44
    shift $S7, $P28
.annotate 'line', 8017
    $P20 = $P16[$S7]
    __ARG_1.'emitfind_lex'($S7, $P20)
    goto __label_43
 __label_44: # endfor
# }
 __label_42: # endif
.annotate 'line', 8020
# var body: $P17
    getattribute $P17, self, 'body'
.annotate 'line', 8021
    $P20 = $P17.'isempty'()
    if_null $P20, __label_45
    unless $P20 goto __label_45
.annotate 'line', 8022
    __ARG_1.'comment'('Empty body')
    goto __label_46
 __label_45: # else
# {
.annotate 'line', 8024
    __ARG_1.'comment'('Body')
.annotate 'line', 8025
    $P17.'emit'(__ARG_1)
.annotate 'line', 8026
    $P20 = $P17.'getend'()
    __ARG_1.'annotate'($P20)
# }
 __label_46: # endif
.annotate 'line', 8028
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8031
# var localfun: $P18
    getattribute $P18, self, 'localfun'
.annotate 'line', 8032
    if_null $P18, __label_47
# {
# for loop
.annotate 'line', 8033
# ifn: $I4
    null $I4
 __label_50: # for condition
# predefined elements
    elements $I5, $P18
    ge $I4, $I5, __label_49
# {
.annotate 'line', 8034
# var fn: $P19
    $P19 = $P18[$I4]
.annotate 'line', 8035
    $P19.'emit'(__ARG_1)
# }
 __label_48: # for iteration
.annotate 'line', 8033
    inc $I4
    goto __label_50
 __label_49: # for end
# }
 __label_47: # endif
# }
.annotate 'line', 8038

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7711
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7713
    addattribute $P0, 'name'
.annotate 'line', 7714
    addattribute $P0, 'subid'
.annotate 'line', 7715
    addattribute $P0, 'modifiers'
.annotate 'line', 7716
    addattribute $P0, 'params'
.annotate 'line', 7717
    addattribute $P0, 'body'
.annotate 'line', 7718
    addattribute $P0, 'regstI'
.annotate 'line', 7719
    addattribute $P0, 'regstN'
.annotate 'line', 7720
    addattribute $P0, 'regstS'
.annotate 'line', 7721
    addattribute $P0, 'regstP'
.annotate 'line', 7722
    addattribute $P0, 'nlabel'
.annotate 'line', 7723
    addattribute $P0, 'localfun'
.annotate 'line', 7724
    addattribute $P0, 'lexicals'
.annotate 'line', 7725
    addattribute $P0, 'usedlexicals'
.annotate 'line', 7726
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8050
# Body
# {
.annotate 'line', 8052
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8053
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8054
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8055
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8056

.end # FunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 8058
# Body
# {
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
.annotate 'line', 8059
# Body
# {
.annotate 'line', 8062
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8063
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8064
    assign $P1, $I1
.annotate 'line', 8065
    .return($I1)
# }
.annotate 'line', 8066

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 8067
# Body
# {
.annotate 'line', 8070
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8071
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8072
    assign $P1, $I1
.annotate 'line', 8073
    .return($I1)
# }
.annotate 'line', 8074

.end # getlexnum


.sub 'ismethod' :method
.annotate 'line', 8075
# Body
# {
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 8077
# Body
# {
.annotate 'line', 8079
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8080
    setattribute self, 'name', $P1
.annotate 'line', 8081
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8082
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 8083
# var modifiers: $P3
    new $P3, [ 'ModifierList' ]
    $P3.'ModifierList'(__ARG_1, self)
.annotate 'line', 8084
    setattribute self, 'modifiers', $P3
.annotate 'line', 8085
    $P2 = __ARG_1.'get'()
# }
 __label_0: # endif
.annotate 'line', 8087
    'RequireOp'('(', $P2)
.annotate 'line', 8088
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8090
# var fullname: $P4
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P4, $P5
.annotate 'line', 8091
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P4, $P5
.annotate 'line', 8093
    new $P6, [ 'StringLiteral' ]
.annotate 'line', 8094
    new $P8, [ 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P10, $P1, 'line'
# predefined join
    join $S1, '.', $P4
    $P8.'TokenQuoted'($P9, $P10, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
.annotate 'line', 8092
    self.'createconst'('__FUNCTION__', 'S', $P5, '')
.annotate 'line', 8097
    $P2 = __ARG_1.'get'()
.annotate 'line', 8098
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_1
.annotate 'line', 8099
    'ExpectedOp'('{', $P2)
 __label_1: # endif
.annotate 'line', 8100
    new $P7, [ 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8101
    .return(self)
# }
.annotate 'line', 8102

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8045
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8047
    addattribute $P0, 'paramnum'
.annotate 'line', 8048
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8111
# Body
# {
.annotate 'line', 8113
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8114
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8115
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8116
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8117
    setattribute self, 'name', $P1
.annotate 'line', 8118
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8119
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8120
    'RequireOp'('{', $P2)
.annotate 'line', 8121
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8122
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8123

.end # LocalFunctionStatement


.sub 'isanonymous' :method
.annotate 'line', 8124
# Body
# {
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
.annotate 'line', 8125
# Body
# {
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
.annotate 'line', 8126
# Body
# {
.annotate 'line', 8128
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8129

.end # getsubid


.sub 'getparamnum' :method
.annotate 'line', 8130
# Body
# {
.annotate 'line', 8133
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8134

.end # getparamnum


.sub 'getlexnum' :method
.annotate 'line', 8135
# Body
# {
.annotate 'line', 8138
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8139

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
.annotate 'line', 8140
# Body
# {
.annotate 'line', 8142
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8143
    unless_null $P1, __label_0
# {
.annotate 'line', 8146
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8147
    unless_null $P1, __label_1
# {
.annotate 'line', 8149
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8150
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8151
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8152
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
 __label_5:
.annotate 'line', 8153
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8154
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 8155
    self.'setusedlex'($S1, $S2)
# }
 __label_4: # endif
# }
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 8159
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
 __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8160
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8161
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8162
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8163
    isa $I2, $P4, 'FunctionBase'
    unless $I2 goto __label_9
# {
.annotate 'line', 8164
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8165
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
 __label_11:
.annotate 'line', 8166
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8167
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8168
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8169
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 8170
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
.annotate 'line', 8175
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, 'VarData'
    not $I2, $I3
 __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8176
    'InternalError'('Incorrect data for variable in LocalFunction')
 __label_13: # endif
.annotate 'line', 8177
    .return($P1)
# }
.annotate 'line', 8178

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8109
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8187
# Body
# {
.annotate 'line', 8189
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8190

.end # MethodStatement


.sub 'ismethod' :method
.annotate 'line', 8191
# Body
# {
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8185
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
.annotate 'line', 8206
# Body
# {
.annotate 'line', 8208
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8209

.end # ClassSpecifier


.sub 'reftype' :method
.annotate 'line', 8210
# Body
# {
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
.annotate 'line', 8212
# Body
# {
.annotate 'line', 8214
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8215

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8204
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8221
# Body
# {
.annotate 'line', 8223
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8224
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8225

.end # ClassSpecifierStr


.sub 'reftype' :method
.annotate 'line', 8226
# Body
# {
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8228
# Body
# {
.annotate 'line', 8230
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 8231
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8232

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8218
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8220
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8239
# Body
# {
.annotate 'line', 8241
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8242
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8243
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8244
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8245
    'Expected'('literal string', $P2)
 __label_0: # endif
.annotate 'line', 8246
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8247
    $P2 = __ARG_1.'get'()
.annotate 'line', 8248
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8249
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 8251
    box $P5, 1
    setattribute self, 'hll', $P5
 __label_5: # case
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 8255
    'SyntaxError'('Unexpected token in class key', $P2)
 __label_2: # switch end
 __label_6: # do
.annotate 'line', 8257
# {
.annotate 'line', 8258
    $P2 = __ARG_1.'get'()
.annotate 'line', 8259
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8260
    'Expected'('literal string', $P2)
 __label_9: # endif
.annotate 'line', 8261
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
 __label_8: # continue
.annotate 'line', 8262
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
 __label_7: # enddo
.annotate 'line', 8263
    'RequireOp'(']', $P2)
# }
 __label_1: # endif
.annotate 'line', 8265
    setattribute self, 'key', $P1
# }
.annotate 'line', 8266

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
.annotate 'line', 8267
# Body
# {
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
.annotate 'line', 8268
# Body
# {
# predefined int
.annotate 'line', 8270
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8271

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8273
# Body
# {
.annotate 'line', 8275
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8276

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8235
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8237
    addattribute $P0, 'key'
.annotate 'line', 8238
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8282
# Body
# {
.annotate 'line', 8284
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8285
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8286
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 8287
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8288
    $P2 = __ARG_1.'get'()
.annotate 'line', 8289
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 8291
    __ARG_1.'unget'($P2)
.annotate 'line', 8292
    setattribute self, 'key', $P1
# }
.annotate 'line', 8293

.end # ClassSpecifierId


.sub 'reftype' :method
.annotate 'line', 8294
# Body
# {
    .return(3)
# }

.end # reftype


.sub 'last' :method
.annotate 'line', 8296
# Body
# {
.annotate 'line', 8298
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8299
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8300

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8302
# Body
# {
.annotate 'line', 8304
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8305
    unless_null $P1, __label_0
# {
.annotate 'line', 8306
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8307
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
 __label_2: # endif
.annotate 'line', 8308
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 8310
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
 __label_1: # endif
# }
.annotate 'line', 8311

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8279
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8281
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8314
# Body
# {
.annotate 'line', 8316
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8317
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8318
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_0: # endif
.annotate 'line', 8319
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8320
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_1: # endif
.annotate 'line', 8321
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8322
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_2: # endif
.annotate 'line', 8323
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8324

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8340
# Body
# {
.annotate 'line', 8342
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8343
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8344
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8345
    setattribute self, 'functions', $P1
.annotate 'line', 8346
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8347
    setattribute self, 'members', $P2
.annotate 'line', 8348
    root_new $P13, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P13
.annotate 'line', 8349
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8350
    setattribute self, 'constants', $P3
.annotate 'line', 8352
# var name: $P4
    $P4 = __ARG_2.'get'()
.annotate 'line', 8353
    setattribute self, 'name', $P4
.annotate 'line', 8354
# var classns: $P5
    $P12 = __ARG_3.'getpath'()
# predefined clone
    clone $P5, $P12
.annotate 'line', 8355
    getattribute $P12, self, 'name'
# predefined push
    push $P5, $P12
.annotate 'line', 8356
    setattribute self, 'classns', $P5
.annotate 'line', 8358
# var t: $P6
    $P6 = __ARG_2.'get'()
.annotate 'line', 8359
    $P12 = $P6.'isop'(':')
    if_null $P12, __label_0
    unless $P12 goto __label_0
# {
.annotate 'line', 8360
# var bases: $P7
    getattribute $P7, self, 'bases'
 __label_2: # Infinite loop
.annotate 'line', 8361
# {
.annotate 'line', 8362
# var base: $P8
    $P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8363
# predefined push
    push $P7, $P8
.annotate 'line', 8364
    $P6 = __ARG_2.'get'()
.annotate 'line', 8365
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
.annotate 'line', 8368
    'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8369
    $P6 = __ARG_2.'get'()
 __label_6: # for condition
    $P12 = $P6.'isop'('}')
    isfalse $I1, $P12
    unless $I1 goto __label_5
# {
.annotate 'line', 8370
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
.annotate 'line', 8372
# var f: $P9
    new $P9, [ 'MethodStatement' ]
    $P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8373
# predefined push
    push $P1, $P9
    goto __label_7 # break
 __label_10: # case
.annotate 'line', 8376
# var name: $P10
    $P10 = __ARG_2.'get'()
.annotate 'line', 8377
    $P14 = $P10.'isidentifier'()
    isfalse $I2, $P14
    unless $I2 goto __label_12
.annotate 'line', 8378
    'Expected'("member identifier", $P10)
 __label_12: # endif
.annotate 'line', 8379
# predefined push
    push $P2, $P10
.annotate 'line', 8380
    $P6 = __ARG_2.'get'()
.annotate 'line', 8381
    $P15 = $P6.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_13
.annotate 'line', 8382
    'Expected'("';' in member declaration", $P6)
 __label_13: # endif
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 8385
# var cst: $P11
    $P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8386
# predefined push
    push $P3, $P11
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 8389
    'SyntaxError'("Unexpected item in class", $P6)
 __label_7: # switch end
# }
 __label_4: # for iteration
.annotate 'line', 8369
    $P6 = __ARG_2.'get'()
    goto __label_6
 __label_5: # for end
# }
.annotate 'line', 8392

.end # ClassStatement


.sub 'getpath' :method
.annotate 'line', 8393
# Body
# {
.annotate 'line', 8395
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8396

.end # getpath


.sub 'generatesubid' :method
.annotate 'line', 8397
# Body
# {
.annotate 'line', 8399
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8400

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
.annotate 'line', 8401
# Body
# {
.annotate 'line', 8403
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8404

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
.annotate 'line', 8405
# Body
# {
.annotate 'line', 8407
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8408

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 8409
# Body
# {
.annotate 'line', 8411
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8412

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
.annotate 'line', 8413
# Body
# {
.annotate 'line', 8415
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8416

.end # use_predef


.sub 'optimize' :method
.annotate 'line', 8417
# Body
# {
.annotate 'line', 8419
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8420
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8421
    .return(self)
# }
.annotate 'line', 8422

.end # optimize


.sub 'getclasskey' :method
.annotate 'line', 8423
# Body
# {
.annotate 'line', 8425
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8426

.end # getclasskey


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8427
# Body
# {
.annotate 'line', 8429
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8430
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8431
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8432
    $P2.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8434
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8436
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8437
# n: $I1
    set $I1, 1
.annotate 'line', 8438
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8439
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8440
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8441
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8442
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8443
    __ARG_1.'say'()
.annotate 'line', 8444
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8446
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
 __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8447
    __ARG_1.'annotate'($P4)
.annotate 'line', 8448
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 8451
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8452

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8330
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8332
    addattribute $P0, 'parent'
.annotate 'line', 8333
    addattribute $P0, 'name'
.annotate 'line', 8334
    addattribute $P0, 'bases'
.annotate 'line', 8335
    addattribute $P0, 'constants'
.annotate 'line', 8336
    addattribute $P0, 'functions'
.annotate 'line', 8337
    addattribute $P0, 'members'
.annotate 'line', 8338
    addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 8459
# Body
# {
.annotate 'line', 8461
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8462
    $P9 = $P1.'isstring'()
    isfalse $I2, $P9
    unless $I2 goto __label_0
.annotate 'line', 8463
    'Expected'('literal string', $P1)
 __label_0: # endif
.annotate 'line', 8464
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8465
# filename: $S1
    $P9 = $P1.'rawstring'()
    null $S1
    if_null $P9, __label_1
    set $S1, $P9
 __label_1:
.annotate 'line', 8466
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8471
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8472
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8473
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8474
    iter $P10, $P4
    set $P10, 0
 __label_2: # for iteration
    unless $P10 goto __label_3
    shift $S2, $P10
# {
.annotate 'line', 8475
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8476
# try: create handler
    new $P9, 'ExceptionHandler'
    set_label $P9, __label_4
    push_eh $P9
# try: begin
# {
.annotate 'line', 8477
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8478
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8476
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
.annotate 'line', 8483
    $P9 = $P5.'is_closed'()
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 8484
    'SyntaxError'('File not found', $P1)
 __label_6: # endif
.annotate 'line', 8489
    load_bytecode 'PGE.pbc'
.annotate 'line', 8490
# var regexcomp: $P6
# predefined compreg
    compreg $P6, 'PGE::P5Regex'
.annotate 'line', 8491
# var rule: $P7
    $P7 = $P6('^\.macro_const\s+([A-Za-z0-9_]+)\s+(\S+)')
# for loop
.annotate 'line', 8493
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
.annotate 'line', 8494
    new $P8, ['ResizableStringArray']
.annotate 'line', 8495
    $P8 = $P7($S4)
.annotate 'line', 8496
# predefined elements
    elements $I2, $P8
    le $I2, 0, __label_11
# {
.annotate 'line', 8497
# name: $S5
    $S5 = $P8[0]
.annotate 'line', 8498
# value: $S6
    $S6 = $P8[1]
.annotate 'line', 8499
# ivalue: $I1
    null $I1
.annotate 'line', 8500
# predefined substr
    substr $S7, $S6, 0, 2
    iseq $I2, $S7, '0x'
    if $I2 goto __label_14
# predefined substr
    substr $S8, $S6, 0, 2
    iseq $I2, $S8, '0X'
 __label_14:
    unless $I2 goto __label_12
.annotate 'line', 8501
# predefined substr
    substr $S9, $S6, 2
    box $P11, $S9
    $P9 = $P11.'to_int'(16)
    set $I1, $P9
    goto __label_13
 __label_12: # else
.annotate 'line', 8503
    set $I1, $S6
 __label_13: # endif
.annotate 'line', 8506
    new $P12, [ 'TokenInteger' ]
    getattribute $P13, __ARG_1, 'file'
    getattribute $P14, __ARG_1, 'line'
    $P12.'TokenInteger'($P13, $P14, $S5)
    set $P11, $P12
.annotate 'line', 8505
    $P9 = 'integerValue'(__ARG_3, $P11, $I1)
.annotate 'line', 8504
    __ARG_3.'createconst'($S5, 'I', $P9, '')
# }
 __label_11: # endif
# }
 __label_7: # for iteration
.annotate 'line', 8493
    $P9 = $P5.'readline'()
    set $S4, $P9
    goto __label_9
 __label_8: # for end
.annotate 'line', 8510
    $P5.'close'()
# }
.annotate 'line', 8511

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
.annotate 'line', 8524
# Body
# {
.annotate 'line', 8526
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 8527
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8528
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8529
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8530
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8531

.end # NamespaceBase


.sub 'getpath' :method
.annotate 'line', 8532
# Body
# {
.annotate 'line', 8534
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8535

.end # getpath


.sub 'checkclass_base' :method
        .param string __ARG_1
.annotate 'line', 8536
# Body
# {
.annotate 'line', 8538
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8539
    iter $P3, $P1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8540
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 8541
    .return($P2)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P4
.annotate 'line', 8542
    .return($P4)
# }
.annotate 'line', 8543

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
.annotate 'line', 8544
# Body
# {
.annotate 'line', 8548
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
.annotate 'line', 8550
    .return($P5)
 __label_3: # case
.annotate 'line', 8553
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
 __label_1: # default
.annotate 'line', 8558
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 8559
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 8560
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 8561
    iter $P8, $P1
    set $P8, 0
 __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 8562
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 8563
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8564
    if_null $P4, __label_8
.annotate 'line', 8565
    .return($P4)
 __label_8: # endif
# }
 __label_7: # endif
# }
    goto __label_5
 __label_6: # endfor
 __label_0: # switch end
    null $P5
.annotate 'line', 8569
    .return($P5)
# }
.annotate 'line', 8570

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
.annotate 'line', 8571
# Body
# {
.annotate 'line', 8575
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
.annotate 'line', 8577
    .return($P7)
 __label_3: # case
.annotate 'line', 8579
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 8581
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 8582
    if_null $P1, __label_4
.annotate 'line', 8583
    .return($P1)
 __label_4: # endif
.annotate 'line', 8584
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
 __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 8585
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 8586
    .return($P2)
 __label_7: # endif
    goto __label_5
 __label_6: # endfor
    null $P11
.annotate 'line', 8587
    .return($P11)
 __label_1: # default
.annotate 'line', 8592
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 8593
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 8594
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
 __label_8:
.annotate 'line', 8595
    iter $P13, $P3
    set $P13, 0
 __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 8596
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 8597
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8598
    if_null $P6, __label_12
.annotate 'line', 8599
    .return($P6)
 __label_12: # endif
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
 __label_0: # switch end
    null $P7
.annotate 'line', 8603
    .return($P7)
# }
.annotate 'line', 8604

.end # findsymbol


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.annotate 'line', 8605
# Body
# {
.annotate 'line', 8607
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8608
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 8609
    $P1 = __ARG_2.'get'()
.annotate 'line', 8611
# var modifier: $P2
    null $P2
.annotate 'line', 8612
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8613
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 8614
    $P1 = __ARG_2.'get'()
# }
 __label_1: # endif
.annotate 'line', 8617
    'RequireOp'('{', $P1)
.annotate 'line', 8618
# var child: $P3
    new $P3, [ 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8619
    getattribute $P4, self, 'namespaces'
# predefined push
    push $P4, $P3
.annotate 'line', 8620
    getattribute $P4, self, 'items'
# predefined push
    push $P4, $P3
.annotate 'line', 8621
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 8622

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 8623
# Body
# {
.annotate 'line', 8625
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 8626
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 8627
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 8628
# var t: $P4
    null $P4
# for loop
.annotate 'line', 8629
    $P4 = __ARG_1.'get'()
 __label_2: # for condition
    set $I1, $P4
    unless $I1 goto __label_3
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 8631
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
.annotate 'line', 8633
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 8636
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8637
# predefined push
    push $P1, $P5
    goto __label_4 # break
 __label_8: # case
.annotate 'line', 8640
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8641
# predefined push
    push $P2, $P6
.annotate 'line', 8642
# predefined push
    push $P1, $P6
    goto __label_4 # break
 __label_9: # case
.annotate 'line', 8645
# var c: $P7
    new $P7, [ 'ClassStatement' ]
    $P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8646
# predefined push
    push $P3, $P7
.annotate 'line', 8647
# predefined push
    push $P1, $P7
    goto __label_4 # break
 __label_10: # case
.annotate 'line', 8650
    $P4 = __ARG_1.'get'()
.annotate 'line', 8651
    $P10 = $P4.'iskeyword'('extern')
    isfalse $I2, $P10
    unless $I2 goto __label_14
.annotate 'line', 8652
    'SyntaxError'('Unsupported at namespace level', $P4)
 __label_14: # endif
.annotate 'line', 8653
    $P4 = __ARG_1.'get'()
.annotate 'line', 8654
    $P11 = $P4.'isstring'()
    isfalse $I3, $P11
    unless $I3 goto __label_15
.annotate 'line', 8655
    'Expected'('string literal', $P4)
 __label_15: # endif
.annotate 'line', 8656
# reqlib: $S1
    set $P12, $P4
    null $S1
    if_null $P12, __label_16
    set $S1, $P12
 __label_16:
.annotate 'line', 8657
    self.'addlib'($S1)
.annotate 'line', 8658
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
 __label_11: # case
.annotate 'line', 8661
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_12: # case
.annotate 'line', 8664
    $P4 = __ARG_1.'get'()
.annotate 'line', 8665
    $P13 = $P4.'isstring'()
    isfalse $I4, $P13
    unless $I4 goto __label_17
.annotate 'line', 8666
    'Expected'('string literal', $P4)
 __label_17: # endif
.annotate 'line', 8667
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8668
    new $P16, [ 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P4)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_4 # break
 __label_13: # case
.annotate 'line', 8671
    $P4 = __ARG_1.'get'()
.annotate 'line', 8672
    $P17 = $P4.'isstring'()
    isfalse $I5, $P17
    unless $I5 goto __label_18
.annotate 'line', 8673
    'Expected'('string literal', $P4)
 __label_18: # endif
.annotate 'line', 8674
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8675
    new $P20, [ 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P4)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 8678
    'SyntaxError'("Unexpected token", $P4)
 __label_4: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 8629
    $P4 = __ARG_1.'get'()
    goto __label_2
 __label_1: # for end
.annotate 'line', 8681
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 8682
    self.'close_ns'($P4)
    goto __label_20
 __label_19: # else
.annotate 'line', 8684
    self.'unclosed_ns'()
 __label_20: # endif
# }
.annotate 'line', 8685

.end # parse


.sub 'optimize_base' :method
.annotate 'line', 8686
# Body
# {
.annotate 'line', 8688
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 8689

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.annotate 'line', 8690
# Body
# {
.annotate 'line', 8692
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 8693
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 8695
# activate: $I1
    set $I1, 1
.annotate 'line', 8696
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
 __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8697
    isa $I2, $P2, 'NamespaceStatement'
    if $I2 goto __label_5
.annotate 'line', 8698
    isa $I2, $P2, 'ClassStatement'
 __label_5:
    unless $I2 goto __label_3
.annotate 'line', 8699
    set $I1, 1
    goto __label_4
 __label_3: # else
.annotate 'line', 8701
    unless $I1 goto __label_6
# {
.annotate 'line', 8702
    __ARG_1.'say'($S1)
.annotate 'line', 8703
    null $I1
# }
 __label_6: # endif
 __label_4: # endif
.annotate 'line', 8705
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 8707

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8515
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8517
    addattribute $P0, 'nspath'
.annotate 'line', 8518
    addattribute $P0, 'namespaces'
.annotate 'line', 8519
    addattribute $P0, 'classes'
.annotate 'line', 8520
    addattribute $P0, 'functions'
.annotate 'line', 8521
    addattribute $P0, 'items'
.annotate 'line', 8522
    addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.annotate 'line', 8722
# Body
# {
.annotate 'line', 8725
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8726
# predefined push
    push $P1, __ARG_3
.annotate 'line', 8727
    self.'NamespaceBase'($P1)
.annotate 'line', 8729
    setattribute self, 'parent', __ARG_1
.annotate 'line', 8730
    setattribute self, 'start', __ARG_2
.annotate 'line', 8731
    setattribute self, 'owner', __ARG_1
.annotate 'line', 8732
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 8733
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 8734
    if_null __ARG_4, __label_0
# {
.annotate 'line', 8735
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 8736
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
 __label_1: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8738

.end # NamespaceStatement


.sub 'dowarnings' :method
.annotate 'line', 8739
# Body
# {
.annotate 'line', 8741
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8742

.end # dowarnings


.sub 'generatesubid' :method
.annotate 'line', 8743
# Body
# {
.annotate 'line', 8745
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8746

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
.annotate 'line', 8747
# Body
# {
.annotate 'line', 8749
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8750

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 8751
# Body
# {
.annotate 'line', 8753
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8754

.end # addlib


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 8755
# Body
# {
.annotate 'line', 8757
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 8758

.end # addlib


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 8759
# Body
# {
.annotate 'line', 8761
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8762
    unless_null $P1, __label_0
.annotate 'line', 8763
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 8765
    .return($P1)
 __label_1: # endif
# }
.annotate 'line', 8766

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
.annotate 'line', 8767
# Body
# {
.annotate 'line', 8771
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8772
    unless_null $P1, __label_0
.annotate 'line', 8773
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
 __label_0: # endif
.annotate 'line', 8774
    .return($P1)
# }
.annotate 'line', 8775

.end # findclasskey


.sub 'unclosed_ns' :method
.annotate 'line', 8776
# Body
# {
.annotate 'line', 8778
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8779

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.annotate 'line', 8780
# Empty body

.end # close_ns


.sub 'optimize' :method
.annotate 'line', 8784
# Body
# {
.annotate 'line', 8786
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 8787
    if_null $P1, __label_0
# {
.annotate 'line', 8788
    $P1 = $P1.'optimize'()
.annotate 'line', 8789
    setattribute self, 'modifier', $P1
# }
 __label_0: # endif
.annotate 'line', 8791
    self.'optimize_base'()
.annotate 'line', 8792
    .return(self)
# }
.annotate 'line', 8793

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8794
# Body
# {
.annotate 'line', 8796
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 8797
    if_null $P1, __label_0
.annotate 'line', 8798
    __ARG_1.'say'(".HLL '", $P1, "'")
 __label_0: # endif
.annotate 'line', 8800
    self.'emit_base'(__ARG_1)
.annotate 'line', 8802
    if_null $P1, __label_1
.annotate 'line', 8803
    __ARG_1.'say'(".HLL 'parrot'")
 __label_1: # endif
# }
.annotate 'line', 8804

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8714
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8716
    addattribute $P0, 'parent'
.annotate 'line', 8717
    addattribute $P0, 'start'
.annotate 'line', 8718
    addattribute $P0, 'name'
.annotate 'line', 8719
    addattribute $P0, 'modifier'
.annotate 'line', 8720
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
.annotate 'line', 8819
# Body
# {
.annotate 'line', 8821
    new $P1, ['ResizableStringArray']
.annotate 'line', 8822
    self.'NamespaceBase'($P1)
.annotate 'line', 8823
    setattribute self, 'unit', __ARG_1
.annotate 'line', 8824
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 8825
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8826

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
.annotate 'line', 8827
# Body
# {
.annotate 'line', 8829
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8830
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8831

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
.annotate 'line', 8832
# Body
# {
.annotate 'line', 8834
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8835
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
 __label_1:
    set $I1, 1
 __label_0:
    .return($I1)
# }
.annotate 'line', 8836

.end # predef_is_used


.sub 'generatesubid' :method
.annotate 'line', 8838
# Body
# {
.annotate 'line', 8840
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 8841
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8842
    inc $I1
.annotate 'line', 8843
    assign $P1, $I1
.annotate 'line', 8844
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 8845
    .return($S1)
# }
.annotate 'line', 8846

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
.annotate 'line', 8848
# Body
# {
.annotate 'line', 8850
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 8851
    unless_null $P1, __label_0
# {
.annotate 'line', 8852
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8853
    setattribute self, 'libs', $P1
# }
 __label_0: # endif
.annotate 'line', 8855
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8856

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
.annotate 'line', 8857
# Body
# {
.annotate 'line', 8859
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 8860
    unless_null $P1, __label_0
# {
.annotate 'line', 8861
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8862
    setattribute self, 'loads', $P1
# }
 __label_0: # endif
.annotate 'line', 8864
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8865

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
.annotate 'line', 8866
# Body
# {
.annotate 'line', 8868
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8869

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
.annotate 'line', 8870
# Body
# {
.annotate 'line', 8873
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8874

.end # findclasskey


.sub 'unclosed_ns' :method
.annotate 'line', 8875
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.annotate 'line', 8879
# Body
# {
.annotate 'line', 8881
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8882

.end # close_ns


.sub 'dowarnings' :method
.annotate 'line', 8883
# Body
# {
.annotate 'line', 8885
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8886

.end # dowarnings


.sub 'optimize' :method
.annotate 'line', 8887
# Body
# {
.annotate 'line', 8889
    self.'optimize_base'()
.annotate 'line', 8890
    .return(self)
# }
.annotate 'line', 8891

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8892
# Body
# {
.annotate 'line', 8894
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8897
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 8898
    self.'addload'('"String/Utils.pbc"')
 __label_0: # endif
.annotate 'line', 8901
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
.annotate 'line', 8904
    iter $P6, $P2
    set $P6, 0
 __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 8905
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 8906
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 8907
# }
 __label_3: # endif
    goto __label_1
 __label_2: # endfor
.annotate 'line', 8910
# somelib: $I1
    null $I1
.annotate 'line', 8911
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 8912
    if_null $P3, __label_4
# {
.annotate 'line', 8913
    set $I1, 1
.annotate 'line', 8914
    iter $P7, $P3
    set $P7, 0
 __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 8915
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
 __label_6: # endfor
# }
 __label_4: # endif
.annotate 'line', 8918
# someload: $I2
    null $I2
.annotate 'line', 8919
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 8920
    if_null $P4, __label_7
# {
.annotate 'line', 8921
    set $I2, 1
.annotate 'line', 8922
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 8923
    iter $P8, $P4
    set $P8, 0
 __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 8924
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
 __label_9: # endfor
.annotate 'line', 8925
    __ARG_1.'print'(".end\n\n")
# }
 __label_7: # endif
.annotate 'line', 8927
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 8928
    __ARG_1.'comment'('end libs')
 __label_10: # endif
.annotate 'line', 8930
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 8931

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8811
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8813
    addattribute $P0, 'unit'
.annotate 'line', 8814
    addattribute $P0, 'predefs_used'
.annotate 'line', 8815
    addattribute $P0, 'libs'
.annotate 'line', 8816
    addattribute $P0, 'loads'
.annotate 'line', 8817
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
.annotate 'line', 8945
# Body
# {
.annotate 'line', 8947
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 8948
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 8951
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 8955
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 8954
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 8953
    $P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 8959
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 8958
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 8957
    $P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 8965
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 8966
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
.annotate 'line', 8964
    $P1.'createconst'('__STAGE__', 'S', $P3, '')
.annotate 'line', 8969
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 8970

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
.annotate 'line', 8971
# Body
# {
.annotate 'line', 8973
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 8974

.end # setwarnmode


.sub 'dowarnings' :method
.annotate 'line', 8975
# Body
# {
# predefined int
.annotate 'line', 8977
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 8978

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
.annotate 'line', 8979
# Body
# {
.annotate 'line', 8981
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 8982

.end # parse


.sub 'optimize' :method
.annotate 'line', 8983
# Body
# {
.annotate 'line', 8985
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 8986

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.annotate 'line', 8987
# Body
# {
.annotate 'line', 8989
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 8990
    __ARG_1.'say'('')
.annotate 'line', 8992
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8994
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 8995

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 8942
    addattribute $P0, 'rootns'
.annotate 'line', 8943
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.annotate 'line', 9002
# Body
# {
.annotate 'line', 9004
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 9005
    .return(__ARG_1)
 __label_0: # endif
.annotate 'line', 9006
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9007
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9008
# var emit: $P2
    new $P2, [ 'Emit' ]
.annotate 'line', 9009
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 9010
    $P2.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9011
    $P2.'initialize'($P1)
.annotate 'line', 9012
    __ARG_1.'emit'($P2)
.annotate 'line', 9013
    $P2.'close'()
.annotate 'line', 9014
    $P1.'close'()
.annotate 'line', 9015
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 9016
# var object: $P3
    null $P3
.annotate 'line', 9017
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
.annotate 'line', 9019
    new $P3, [ 'String' ]
.annotate 'line', 9020
    assign $P3, $S1
    goto __label_3 # break
 __label_6: # case
 __label_7: # case
.annotate 'line', 9024
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9025
    $P3 = $P4($S1)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 9026
# predefined die
.annotate 'line', 9028
    die 'Invalid target'
 __label_3: # switch end
.annotate 'line', 9030
    .return($P3)
# }
.annotate 'line', 9031

.end # __private_compile_tail


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
.annotate 'line', 9032
# Body
# {
.annotate 'line', 9037
    unless_null __ARG_2, __label_0
.annotate 'line', 9038
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9039
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9040
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9041
    $P1.'puts'(__ARG_1)
.annotate 'line', 9042
    $P1.'close'()
.annotate 'line', 9043
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9044
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9045
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9046
    unless __ARG_4 goto __label_1
.annotate 'line', 9047
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9048
    $P3.'parse'($P2)
.annotate 'line', 9049
    $P1.'close'()
.annotate 'line', 9050
    $P3.'optimize'()
.annotate 'line', 9051
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9052

.end # compile


.sub 'compile_from_file_to_pir' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
.annotate 'line', 9053
# Body
# {
.annotate 'line', 9057
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9058
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9059
    $P1.'encoding'('utf8')
.annotate 'line', 9060
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9061
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9062
    unless __ARG_4 goto __label_0
.annotate 'line', 9063
    $P3.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9064
    $P3.'parse'($P2)
.annotate 'line', 9065
    $P1.'close'()
.annotate 'line', 9066
    $P3.'optimize'()
.annotate 'line', 9067
# var emit: $P4
    new $P4, [ 'Emit' ]
.annotate 'line', 9068
    unless __ARG_3 goto __label_1
.annotate 'line', 9069
    $P4.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9070
    $P4.'initialize'(__ARG_2)
.annotate 'line', 9071
    $P3.'emit'($P4)
.annotate 'line', 9072
    $P4.'close'()
# }
.annotate 'line', 9073

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
.annotate 'line', 9074
# Body
# {
.annotate 'line', 9079
    unless_null __ARG_2, __label_0
.annotate 'line', 9080
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9081
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9082
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9083
    $P1.'encoding'('utf8')
.annotate 'line', 9084
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9085
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9086
    unless __ARG_4 goto __label_1
.annotate 'line', 9087
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9088
    $P3.'parse'($P2)
.annotate 'line', 9089
    $P1.'close'()
.annotate 'line', 9090
    $P3.'optimize'()
.annotate 'line', 9091
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9092

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
.annotate 'line', 9097
# Body
# {
.annotate 'line', 9099
# var winxed: $P1
    new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9100
    not $I1, __ARG_3
    unless $I1 goto __label_0
.annotate 'line', 9101
    $P1.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9102
    $P1.'parse'(__ARG_1)
.annotate 'line', 9104
    $P1.'optimize'()
.annotate 'line', 9106
# var handle: $P2
    null $P2
.annotate 'line', 9107
    ne __ARG_2, '-', __label_1
.annotate 'line', 9108
# predefined getstdout
    getstdout $P2
    goto __label_2
 __label_1: # else
.annotate 'line', 9110
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'(__ARG_2,'w')
 __label_2: # endif
.annotate 'line', 9111
# var emit: $P3
    new $P3, [ 'Emit' ]
.annotate 'line', 9112
    unless __ARG_4 goto __label_3
.annotate 'line', 9113
    $P3.'disable_annotations'()
 __label_3: # endif
.annotate 'line', 9114
    $P3.'initialize'($P2)
.annotate 'line', 9115
    $P1.'emit'($P3)
.annotate 'line', 9116
    $P3.'close'()
.annotate 'line', 9117
    $P2.'close'()
# }
.annotate 'line', 9118

.end # winxed_parser


.sub 'initializer' :init :load
.annotate 'line', 9124
# Body
# {
.annotate 'line', 9126
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9127
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9128

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
        .param pmc __ARG_1
.annotate 'line', 9135
# Body
# {
.annotate 'line', 9137
    load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9138
# var getopts: $P1
    new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9139
    $P1.'notOptStop'(1)
.annotate 'line', 9140
    $P1.'push_string'('o=s')
.annotate 'line', 9141
    $P1.'push_string'('e=s')
.annotate 'line', 9142
    $P1.'push_string'('noan')
.annotate 'line', 9143
    $P1.'push_string'('nowarn')
.annotate 'line', 9144
    $P1.'notOptStop'(1)
.annotate 'line', 9145
    __ARG_1.'shift'()
.annotate 'line', 9146
# var opts: $P2
    $P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9147
    setattribute self, 'getopts', $P1
.annotate 'line', 9148
    setattribute self, 'opts', $P2
# }
.annotate 'line', 9149

.end # Options


.sub 'getbool' :method
        .param string __ARG_1
.annotate 'line', 9150
# Body
# {
.annotate 'line', 9152
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9153
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9154
    isnull $I1, $P2
    not $I1
    .return($I1)
# }
.annotate 'line', 9155

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
.annotate 'line', 9156
# Body
# {
.annotate 'line', 9158
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9159
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9160
    if_null $P2, __label_1
# predefined string
    set $S1, $P2
    goto __label_0
 __label_1:
    set $S1, __ARG_2
 __label_0:
    .return($S1)
# }
.annotate 'line', 9161

.end # getstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Options' ]
.annotate 'line', 9132
    addattribute $P0, 'getopts'
.annotate 'line', 9133
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
        .param pmc __ARG_1
.annotate 'line', 9164
# Body
# {
.annotate 'line', 9166
# var options: $P1
    new $P1, [ 'Options' ]
    $P1.'Options'(__ARG_1)
.annotate 'line', 9167
# outputfile: $S1
    $P4 = $P1.'getstring'('o', '')
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9168
# expr: $S2
    $P4 = $P1.'getstring'('e')
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 9169
# noan: $I1
    $P4 = $P1.'getbool'('noan')
    set $I1, $P4
.annotate 'line', 9170
# warn: $I2
    $P4 = $P1.'getbool'('nowarn')
    isfalse $I2, $P4
.annotate 'line', 9172
# argc: $I3
    set $P4, __ARG_1
    set $I3, $P4
.annotate 'line', 9173
# filename: $S3
    null $S3
.annotate 'line', 9174
# var file: $P2
    null $P2
.annotate 'line', 9175
    unless_null $S2, __label_2
# {
.annotate 'line', 9176
    ne $I3, 0, __label_4
# predefined Error
.annotate 'line', 9177
    root_new $P4, ['parrot';'Exception']
    $P4['message'] = 'No file'
    throw $P4
 __label_4: # endif
.annotate 'line', 9179
    $S3 = __ARG_1[0]
.annotate 'line', 9180
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'($S3)
.annotate 'line', 9181
    $P2.'encoding'('utf8')
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 9184
    concat $S0, 'function main[main](argv){', $S2
    concat $S0, $S0, ';}'
    set $S2, $S0
.annotate 'line', 9185
    new $P2, [ 'StringHandle' ]
.annotate 'line', 9186
    $P2.'open'('__eval__', 'w')
.annotate 'line', 9187
    $P2.'puts'($S2)
.annotate 'line', 9188
    $P2.'close'()
.annotate 'line', 9189
    $P2.'open'('__eval__')
.annotate 'line', 9190
    set $S3, '__eval__'
# }
 __label_3: # endif
.annotate 'line', 9193
# var t: $P3
    new $P3, [ 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9195
    'winxed_parser'($P3, $S1, $I2, $I1)
.annotate 'line', 9197
    $P2.'close'()
# }
.annotate 'line', 9198

.end # stage1


.sub 'show_backtrace'
        .param pmc __ARG_1
.annotate 'line', 9200
# Body
# {
.annotate 'line', 9202
# i: $I1
    set $I1, 1
.annotate 'line', 9203
    iter $P4, __ARG_1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 9204
# var sub: $P2
    $P2 = $P1['sub']
.annotate 'line', 9205
# subname: $S1
    null $S1
.annotate 'line', 9206
    if_null $P2, __label_2
# {
.annotate 'line', 9207
    set $S1, $P2
.annotate 'line', 9208
# ns: $S2
    $P5 = $P2.'get_namespace'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 9209
    isne $I3, $S2, ''
    unless $I3 goto __label_5
    isne $I3, $S2, 'parrot'
 __label_5:
    unless $I3 goto __label_4
.annotate 'line', 9210
    concat $S0, $S2, '.'
    concat $S0, $S0, $S1
    set $S1, $S0
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 9212
# var ann: $P3
    $P3 = $P1['annotations']
.annotate 'line', 9213
# file: $S3
    $S3 = $P3['file']
.annotate 'line', 9214
    eq $S3, '', __label_6
# {
.annotate 'line', 9215
# line: $I2
    $I2 = $P3['line']
.annotate 'line', 9216
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
.annotate 'line', 9219

.end # show_backtrace


.sub 'main' :main
        .param pmc __ARG_1
.annotate 'line', 9221
# Body
# {
.annotate 'line', 9223
# retval: $I1
    null $I1
.annotate 'line', 9224
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_0
    $P2.'min_severity'(2)
    $P2.'max_severity'(2)
    $P2.'handle_types'(555, 556, 557)
    push_eh $P2
# try: begin
.annotate 'line', 9230
    'stage1'(__ARG_1)
# try: end
    pop_eh
    goto __label_1
.annotate 'line', 9224
# catch
 __label_0:
    .get_results($P1)
    finalize $P1
    pop_eh
# {
.annotate 'line', 9233
# msg: $S1
    $S1 = $P1['message']
.annotate 'line', 9234
# type: $I2
    $I2 = $P1['type']
.annotate 'line', 9235
    set $I3, $I2
    set $I4, 556
    if $I3 == $I4 goto __label_4
    set $I4, 557
    if $I3 == $I4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 9238
# predefined cry
    getstderr $P0
    print $P0, 'Error: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9239
    set $I1, 1
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 9242
# predefined cry
    getstderr $P0
    print $P0, 'INTERNAL ERROR: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9243
    $P2 = $P1.'backtrace'()
    'show_backtrace'($P2)
.annotate 'line', 9244
    set $I1, 2
 __label_2: # switch end
# }
# catch end
 __label_1:
.annotate 'line', 9247
# predefined exit
    exit $I1
# }
.annotate 'line', 9248

.end # main

# End generated code
