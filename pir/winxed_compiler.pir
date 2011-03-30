# Begin generated code

.namespace [ ]

.sub 'isspace'
        .param string __ARG_1
# Body
# {
.annotate 'file', 'winxedst1.winxed'
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
# Body
# {
.annotate 'line', 33
# predefined indexof
.annotate 'line', 30
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 33
    isgt $I1, $I2, -1
.annotate 'line', 30
    .return($I1)
# }
.annotate 'line', 34

.end # isidentstart


.sub 'isident'
        .param string __ARG_1
# Body
# {
.annotate 'line', 42
# predefined indexof
.annotate 'line', 38
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
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
# Body
# {
.annotate 'line', 151
    .return(1)
# }
.annotate 'line', 152

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 155
    .return(1)
# }
.annotate 'line', 156

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 158
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 159
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 160
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 161
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 162
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 163
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 167
    'InternalError'('Not a literal string', self)
# }
.annotate 'line', 168

.end # rawstring


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 171
    'ExpectedIdentifier'(self)
# }
.annotate 'line', 172

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 173
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 174
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 175
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 176
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 177
    .return('(unknown)')
# }

.end # viewable


.sub 'show' :method
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
# Body
# {
.annotate 'line', 189
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 190

.end # TokenEof


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 193
    .return(0)
# }
.annotate 'line', 194

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 197
    .return(0)
# }
.annotate 'line', 198

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 199
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 200
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
# Body
# {
.annotate 'line', 211
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
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
# Body
# {
.annotate 'line', 222
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 223

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 224
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
# Body
# {
.annotate 'line', 231
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 232

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
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
# Body
# {
.annotate 'line', 247
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 248

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 249
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 252
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 253

.end # getidentifier


.sub 'checkkeyword' :method
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
# Body
# {
.annotate 'line', 266
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
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
# Body
# {
.annotate 'line', 277
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 278

.end # TokenQuoted


.sub 'get_string' :method :vtable
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
# Body
# {
.annotate 'line', 293
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 294

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
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
# Body
# {
.annotate 'line', 309
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 310

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 311
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
# Body
# {
.annotate 'line', 318
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 319

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 320
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
# Body
# {
.annotate 'line', 330
# s: $S1
    set $S1, ''
.annotate 'line', 331
# c: $S2
    null $S2
# for loop
.annotate 'line', 332
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_2: # for condition
    eq $S2, '"', __label_1
# {
.annotate 'line', 333
    set $S4, $S2
    set $S5, ""
    if $S4 == $S5 goto __label_5
    set $S5, "\n"
    if $S4 == $S5 goto __label_6
    set $S5, '\'
    if $S4 == $S5 goto __label_7
    goto __label_4
# switch
 __label_5: # case
 __label_6: # case
.annotate 'line', 336
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_7: # case
.annotate 'line', 339
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
 __label_8:
.annotate 'line', 340
    iseq $I1, $S3, ''
    if $I1 goto __label_10
    iseq $I1, $S3, "\n"
 __label_10:
    unless $I1 goto __label_9
.annotate 'line', 341
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_9: # endif
.annotate 'line', 342
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 345
    concat $S1, $S1, $S2
 __label_3: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 332
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
 __label_1: # for end
.annotate 'line', 348
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 349

.end # getquoted


.sub 'getsinglequoted'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 353
# s: $S1
    set $S1, ''
.annotate 'line', 354
# c: $S2
    null $S2
# for loop
.annotate 'line', 355
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_2: # for condition
    eq $S2, "'", __label_1
# {
.annotate 'line', 356
    iseq $I1, $S2, ""
    if $I1 goto __label_4
    iseq $I1, $S2, "\n"
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 357
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
 __label_3: # endif
.annotate 'line', 358
    concat $S1, $S1, $S2
# }
 __label_0: # for iteration
.annotate 'line', 355
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
 __label_1: # for end
.annotate 'line', 360
    new $P2, [ 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 361

.end # getsinglequoted


.sub 'getheredoc'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 365
# mark: $S1
    set $S1, ''
.annotate 'line', 366
# c: $S2
    null $S2
# for loop
.annotate 'line', 367
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_2: # for condition
    eq $S2, "\n", __label_1
# {
.annotate 'line', 368
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_5
    set $S6, '"'
    if $S5 == $S6 goto __label_6
    set $S6, '\'
    if $S5 == $S6 goto __label_7
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 370
    'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
 __label_6: # case
 __label_7: # case
.annotate 'line', 375
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
 __label_4: # default
 __label_3: # switch end
.annotate 'line', 378
    concat $S0, $S1, $S2
    set $S1, $S0
# }
 __label_0: # for iteration
.annotate 'line', 367
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
 __label_1: # for end
.annotate 'line', 380
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 382
# content: $S3
    set $S3, ''
.annotate 'line', 383
# line: $S4
    null $S4
 __label_8: # do
.annotate 'line', 384
# {
.annotate 'line', 385
    set $S4, ''
# for loop
.annotate 'line', 386
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_13: # for condition
    eq $S2, "\n", __label_12
# {
.annotate 'line', 387
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_16
    set $S6, '"'
    if $S5 == $S6 goto __label_17
    set $S6, '\'
    if $S5 == $S6 goto __label_18
    goto __label_15
# switch
 __label_16: # case
.annotate 'line', 389
    'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
 __label_17: # case
 __label_18: # case
.annotate 'line', 392
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_14 # break
 __label_15: # default
 __label_14: # switch end
.annotate 'line', 395
    concat $S4, $S4, $S2
# }
 __label_11: # for iteration
.annotate 'line', 386
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_13
 __label_12: # for end
.annotate 'line', 397
    eq $S4, $S1, __label_19
.annotate 'line', 398
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
 __label_19: # endif
# }
 __label_10: # continue
.annotate 'line', 399
    ne $S4, $S1, __label_8
 __label_9: # enddo
.annotate 'line', 400
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 401

.end # getheredoc


.sub 'getident'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 405
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 406
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 407
    $P1 = 'isident'($S2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 408
    concat $S1, $S1, $S2
.annotate 'line', 409
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 411
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 412
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 413

.end # getident


.sub 'getnumber'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 417
# s: $S1
    null $S1
.annotate 'line', 418
# c: $S2
    set $S2, __ARG_2
 __label_0: # do
.annotate 'line', 419
# {
.annotate 'line', 420
    concat $S1, $S1, $S2
.annotate 'line', 421
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_2: # continue
.annotate 'line', 422
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_1
    if $P1 goto __label_0
 __label_1: # enddo
.annotate 'line', 423
    iseq $I3, $S1, '0'
    unless $I3 goto __label_4
    iseq $I3, $S2, 'x'
    if $I3 goto __label_5
    iseq $I3, $S2, 'X'
 __label_5:
 __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 424
# hexval: $I1
    null $I1
# h: $I2
    null $I2
.annotate 'line', 425
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
 __label_7: # while
.annotate 'line', 426
    $P1 = 'hexdigit'($S2)
    set $I2, $P1
    lt $I2, 0, __label_6
# {
.annotate 'line', 427
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 428
    concat $S1, $S1, $S2
.annotate 'line', 429
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_7
 __label_6: # endwhile
.annotate 'line', 431
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 432
    set $S1, $I1
.annotate 'line', 433
    new $P2, [ 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
 __label_3: # endif
.annotate 'line', 435
    ne $S2, '.', __label_8
# {
 __label_10: # do
.annotate 'line', 436
# {
.annotate 'line', 437
    concat $S1, $S1, $S2
.annotate 'line', 438
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_12: # continue
.annotate 'line', 439
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_11
    if $P1 goto __label_10
 __label_11: # enddo
.annotate 'line', 440
    iseq $I3, $S2, 'e'
    if $I3 goto __label_14
    iseq $I3, $S2, 'E'
 __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 441
    concat $S1, $S1, 'E'
.annotate 'line', 442
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_16
    iseq $I3, $S2, '-'
 __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 443
    concat $S1, $S1, $S2
.annotate 'line', 444
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_15: # endif
 __label_18: # while
.annotate 'line', 446
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_17
    unless $P1 goto __label_17
# {
.annotate 'line', 447
    concat $S1, $S1, $S2
.annotate 'line', 448
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_18
 __label_17: # endwhile
# }
 __label_13: # endif
.annotate 'line', 451
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 452
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 455
    iseq $I3, $S2, 'e'
    if $I3 goto __label_21
    iseq $I3, $S2, 'E'
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 456
    concat $S1, $S1, 'E'
.annotate 'line', 457
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_23
    iseq $I3, $S2, '-'
 __label_23:
    unless $I3 goto __label_22
# {
.annotate 'line', 458
    concat $S1, $S1, $S2
.annotate 'line', 459
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
 __label_22: # endif
 __label_25: # while
.annotate 'line', 461
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_24
    unless $P1 goto __label_24
# {
.annotate 'line', 462
    concat $S1, $S1, $S2
.annotate 'line', 463
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_25
 __label_24: # endwhile
.annotate 'line', 465
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 466
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 469
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 470
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
.annotate 'line', 473

.end # getnumber


.sub 'getlinecomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 477
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 478
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_2: # while
.annotate 'line', 479
    isne $I1, $S2, ''
    unless $I1 goto __label_3
    isne $I1, $S2, "\n"
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 480
    concat $S1, $S1, $S2
.annotate 'line', 481
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
 __label_1: # endwhile
.annotate 'line', 483
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 484

.end # getlinecomment


.sub 'getcomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 488
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 489
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
 __label_0:
 __label_1: # do
.annotate 'line', 490
# {
 __label_5: # while
.annotate 'line', 491
    isne $I1, $S2, ''
    unless $I1 goto __label_6
    isne $I1, $S2, '*'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 492
    concat $S1, $S1, $S2
.annotate 'line', 493
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_5
 __label_4: # endwhile
.annotate 'line', 495
    ne $S2, '', __label_7
.annotate 'line', 496
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
 __label_7: # endif
.annotate 'line', 497
    concat $S1, $S1, $S2
.annotate 'line', 498
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 499
    ne $S2, '', __label_8
.annotate 'line', 500
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
 __label_8: # endif
# }
 __label_3: # continue
.annotate 'line', 501
    ne $S2, '/', __label_1
 __label_2: # enddo
.annotate 'line', 502
    concat $S1, $S1, '/'
.annotate 'line', 503
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 504

.end # getcomment


.sub 'getop'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 508
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 509
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 510

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 526
.const 'Sub' $P2 = 'getop'
.annotate 'line', 528
    setattribute self, 'h', __ARG_1
.annotate 'line', 529
    box $P3, ''
    setattribute self, 'pending', $P3
.annotate 'line', 530
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P4
.annotate 'line', 531
    box $P3, __ARG_2
    setattribute self, 'filename', $P3
.annotate 'line', 532
    box $P3, 1
    setattribute self, 'line', $P3
.annotate 'line', 533
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 534
    root_new $P3, ['parrot';'Hash']
    get_hll_global $P4, 'getident'
    $P3[''] = $P4
    $P3['{'] = $P2
    $P1['$'] = $P3
    get_hll_global $P5, 'getquoted'
    $P1['"'] = $P5
    get_hll_global $P6, 'getsinglequoted'
    $P1["'"] = $P6
.annotate 'line', 537
    root_new $P7, ['parrot';'Hash']
.annotate 'line', 538
    root_new $P8, ['parrot';'Hash']
    $P8[''] = $P2
    $P8['='] = $P2
    $P7['='] = $P8
    $P7[':'] = $P2
    $P1['='] = $P7
.annotate 'line', 541
    root_new $P9, ['parrot';'Hash']
    $P9['+'] = $P2
    $P9['='] = $P2
    $P1['+'] = $P9
.annotate 'line', 542
    root_new $P10, ['parrot';'Hash']
    $P10['-'] = $P2
    $P10['='] = $P2
    $P1['-'] = $P10
.annotate 'line', 543
    root_new $P11, ['parrot';'Hash']
    $P11['='] = $P2
    $P1['*'] = $P11
.annotate 'line', 544
    root_new $P12, ['parrot';'Hash']
    $P12['|'] = $P2
    $P1['|'] = $P12
.annotate 'line', 545
    root_new $P13, ['parrot';'Hash']
    $P13['&'] = $P2
    $P1['&'] = $P13
.annotate 'line', 546
    root_new $P14, ['parrot';'Hash']
.annotate 'line', 547
    root_new $P15, ['parrot';'Hash']
    $P15[''] = $P2
    get_hll_global $P16, 'getheredoc'
    $P15[':'] = $P16
    $P14['<'] = $P15
    $P14['='] = $P2
    $P1['<'] = $P14
.annotate 'line', 550
    root_new $P17, ['parrot';'Hash']
    $P17['>'] = $P2
    $P17['='] = $P2
    $P1['>'] = $P17
.annotate 'line', 551
    root_new $P18, ['parrot';'Hash']
.annotate 'line', 552
    root_new $P19, ['parrot';'Hash']
    $P19[''] = $P2
    $P19['='] = $P2
    $P18['='] = $P19
    $P1['!'] = $P18
.annotate 'line', 554
    root_new $P20, ['parrot';'Hash']
    $P20['%'] = $P2
    $P20['='] = $P2
    $P1['%'] = $P20
.annotate 'line', 555
    root_new $P21, ['parrot';'Hash']
    $P21['='] = $P2
    get_hll_global $P22, 'getlinecomment'
    $P21['/'] = $P22
    get_hll_global $P23, 'getcomment'
    $P21['*'] = $P23
    $P1['/'] = $P21
    get_hll_global $P24, 'getlinecomment'
    $P1['#'] = $P24
.annotate 'line', 558
    setattribute self, 'select', $P1
# }
.annotate 'line', 559

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 562
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 563
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 564
    eq $S1, '', __label_1
.annotate 'line', 565
    assign $P1, ''
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 567
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 568
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 569
    ne $S1, "\n", __label_3
# {
.annotate 'line', 570
# l: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 571
    inc $I1
.annotate 'line', 572
    box $P3, $I1
    setattribute self, 'line', $P3
# }
 __label_3: # endif
# }
 __label_2: # endif
.annotate 'line', 575
    .return($S1)
# }
.annotate 'line', 576

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 579
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 580

.end # ungetchar


.sub 'get_token' :method
# Body
# {
.annotate 'line', 583
.const 'Sub' $P4 = 'isspace'
.annotate 'line', 584
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 585
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 586
.const 'Sub' $P7 = 'getop'
.annotate 'line', 587
.const 'Sub' $P8 = 'getident'
.annotate 'line', 588
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 590
    getattribute $P10, self, 'stacked'
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 591
# var t: $P1
    getattribute $P11, self, 'stacked'
    $P1 = $P11.'pop'()
.annotate 'line', 592
    .return($P1)
# }
 __label_0: # endif
.annotate 'line', 594
# c: $S1
    $P10 = self.'getchar'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
 __label_1:
 __label_3: # while
.annotate 'line', 595
    $P10 = $P4($S1)
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 596
    $P11 = self.'getchar'()
    set $S1, $P11
    goto __label_3
 __label_2: # endwhile
.annotate 'line', 597
# line: $I1
    getattribute $P10, self, 'line'
    set $I1, $P10
.annotate 'line', 598
    ne $S1, '', __label_4
.annotate 'line', 599
    new $P11, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P11.'TokenEof'($P12)
    set $P10, $P11
    .return($P10)
 __label_4: # endif
.annotate 'line', 600
    $P10 = $P5($S1)
    if_null $P10, __label_5
    unless $P10 goto __label_5
.annotate 'line', 601
    .tailcall $P8(self, $S1, $I1)
 __label_5: # endif
.annotate 'line', 602
    $P10 = $P6($S1)
    if_null $P10, __label_6
    unless $P10 goto __label_6
.annotate 'line', 603
    .tailcall $P9(self, $S1, $I1)
 __label_6: # endif
.annotate 'line', 605
# op: $S2
    set $S2, $S1
.annotate 'line', 606
# var select: $P2
    getattribute $P2, self, 'select'
.annotate 'line', 607
# var current: $P3
    $P3 = $P2[$S1]
 __label_8: # while
.annotate 'line', 609
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_9
    isa $I2, $P3, 'Hash'
 __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 610
    $P10 = self.'getchar'()
    set $S1, $P10
.annotate 'line', 611
    set $P2, $P3
.annotate 'line', 612
    $P3 = $P2[$S1]
.annotate 'line', 613
    unless_null $P3, __label_10
# {
.annotate 'line', 614
    self.'ungetchar'($S1)
.annotate 'line', 615
    $P3 = $P2['']
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 618
    concat $S2, $S2, $S1
 __label_11: # endif
# }
    goto __label_8
 __label_7: # endwhile
.annotate 'line', 620
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 621
    .tailcall $P3(self, $S2, $I1)
 __label_12: # endif
.annotate 'line', 622
    .tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 623

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 626
# var t: $P1
    $P1 = self.'get_token'()
 __label_1: # while
.annotate 'line', 627
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_3
    not $I1, __ARG_1
 __label_3:
    unless $I1 goto __label_2
    $I1 = $P1.'iscomment'()
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 628
    $P1 = self.'get_token'()
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 629
    .return($P1)
# }
.annotate 'line', 630

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 633
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 634

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 518
    addattribute $P0, 'h'
.annotate 'line', 519
    addattribute $P0, 'pending'
.annotate 'line', 520
    addattribute $P0, 'select'
.annotate 'line', 521
    addattribute $P0, 'stacked'
.annotate 'line', 522
    addattribute $P0, 'filename'
.annotate 'line', 523
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
# Body
# {
.annotate 'line', 655
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
.annotate 'line', 656
    .return('I')
 __label_3: # case
.annotate 'line', 657
    .return('N')
 __label_4: # case
.annotate 'line', 658
    .return('S')
 __label_5: # case
.annotate 'line', 659
    .return('P')
 __label_1: # default
.annotate 'line', 660
    .return('')
 __label_0: # switch end
# }
.annotate 'line', 662

.end # typetoregcheck


.sub 'typetopirname'
        .param string __ARG_1
# Body
# {
.annotate 'line', 666
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
.annotate 'line', 667
    .return('int')
 __label_3: # case
.annotate 'line', 668
    .return('num')
 __label_4: # case
.annotate 'line', 669
    .return('string')
 __label_5: # case
.annotate 'line', 670
    .return('pmc')
 __label_1: # default
.annotate 'line', 671
    'InternalError'('Invalid reg type')
 __label_0: # switch end
# }
.annotate 'line', 673

.end # typetopirname

# Constant INDENT evaluated at compile time
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 692
    setattribute self, 'handle', __ARG_1
.annotate 'line', 693
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 694
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 695
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 696
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 697

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 700
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 701

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 704
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 705

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 708
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 709
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 711
    getattribute $P5, self, 'file'
.annotate 'line', 709
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 714
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
 __label_0: # endif
.annotate 'line', 716
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 717
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 719
    getattribute $P5, self, 'line'
.annotate 'line', 717
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 722
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
 __label_1: # endif
# }
.annotate 'line', 724

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 727
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 728
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 729

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 732
    self.'updateannot'()
.annotate 'line', 733
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 734

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 737
    self.'updateannot'()
.annotate 'line', 738
    self.'vprint'(__ARG_1)
.annotate 'line', 739
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 740

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 743
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_0
# {
.annotate 'line', 745
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 746
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 747
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
 __label_1:
.annotate 'line', 748
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 749
    set $S2, $P1
    eq $S2, $S1, __label_2
# {
.annotate 'line', 750
    assign $P1, $S1
.annotate 'line', 751
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 752
    assign $P2, 0
# }
 __label_2: # endif
.annotate 'line', 754
    set $I2, $P2
    eq $I2, $I1, __label_3
# {
.annotate 'line', 755
    assign $P2, $I1
.annotate 'line', 756
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
 __label_3: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 759

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 762
    self.'updateannot'()
.annotate 'line', 763
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 764

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 767
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 768
    $P1.'print'(' ')
.annotate 'line', 769
    $P1.'print'(__ARG_1)
.annotate 'line', 770
    $P1.'print'(':')
.annotate 'line', 771
    if_null __ARG_2, __label_0
# {
.annotate 'line', 772
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
# }
 __label_0: # endif
.annotate 'line', 774
    $P1.'print'("\n")
# }
.annotate 'line', 775

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 778
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 779
    $P1.'print'('    goto ')
.annotate 'line', 780
    $P1.'print'(__ARG_1)
.annotate 'line', 781
    if_null __ARG_2, __label_0
# {
.annotate 'line', 782
    $P1.'print'(' # ')
.annotate 'line', 783
    $P1.'print'(__ARG_2)
# }
 __label_0: # endif
.annotate 'line', 785
    $P1.'print'("\n")
# }
.annotate 'line', 786

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 790
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 791

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 794
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 795

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 798
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 799

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 802
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 803

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 806
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 807

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 810
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 811

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 814
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 815

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 819
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 820

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 823
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 824

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 827
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 828

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 831
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 832

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 835
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 836

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 839
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 840

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 843
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 844

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 847
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 848

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 851
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 852

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 855
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 856

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 859
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 860

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 863
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 864

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 867
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 868

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 871
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 872

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 875
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 876

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 879
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 880

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 883
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 884

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 887
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 888

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 891
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 892

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 683
    addattribute $P0, 'handle'
.annotate 'line', 684
    addattribute $P0, 'file'
.annotate 'line', 685
    addattribute $P0, 'line'
.annotate 'line', 686
    addattribute $P0, 'pendingf'
.annotate 'line', 687
    addattribute $P0, 'pendingl'
.annotate 'line', 688
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 901
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 902

.end # integerValue


.sub 'floatValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 906
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 907
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 908

.end # floatValue


.sub 'floatresult'
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 916
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_2
    iseq $I1, __ARG_2, 'I'
 __label_2:
 __label_1:
    if $I1 goto __label_0
.annotate 'line', 917
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_3
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_4
    iseq $I1, __ARG_1, 'I'
 __label_4:
 __label_3:
 __label_0:
.annotate 'line', 918
    .return($I1)
# }
.annotate 'line', 919

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 943
# pos: $I1
# predefined indexof
    index $I1, __ARG_2, '{res}'
.annotate 'line', 944
    iseq $I3, __ARG_1, 'v'
    unless $I3 goto __label_1
    isne $I3, $I1, -1
 __label_1:
    unless $I3 goto __label_0
.annotate 'line', 945
    'InternalError'('void predef with {res}')
 __label_0: # endif
.annotate 'line', 946
    isne $I3, __ARG_1, 'v'
    unless $I3 goto __label_3
    iseq $I3, $I1, -1
 __label_3:
    unless $I3 goto __label_2
.annotate 'line', 947
    'InternalError'('non void predef without {res}')
 __label_2: # endif
.annotate 'line', 948
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 949
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_4
.annotate 'line', 950
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
 __label_4: # endif
.annotate 'line', 951
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 952
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 953
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 954

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 957
# body: $S1
    getattribute $P1, self, 'body'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 958
# typeresult: $S2
    getattribute $P1, self, 'typeresult'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 960
# pos: $I1
    null $I1
.annotate 'line', 961
    ne $S2, 'v', __label_2
# {
.annotate 'line', 962
    isnull $I5, __ARG_3
    not $I5
    unless $I5 goto __label_5
    isne $I5, __ARG_3, ''
 __label_5:
    unless $I5 goto __label_4
.annotate 'line', 963
    'SyntaxError'('using return value from void predef')
 __label_4: # endif
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 966
    isnull $I5, __ARG_3
    if $I5 goto __label_7
    iseq $I5, __ARG_3, ''
 __label_7:
    unless $I5 goto __label_6
.annotate 'line', 967
    'InternalError'('Bad result in non void predef')
 __label_6: # endif
 __label_9: # while
.annotate 'line', 968
# predefined indexof
    index $I1, $S1, '{res}'
    eq $I1, -1, __label_8
.annotate 'line', 969
# predefined replace
    replace $S1, $S1, $I1, 5, __ARG_3
    goto __label_9
 __label_8: # endwhile
# }
 __label_3: # endif
.annotate 'line', 972
# n: $I2
    set $P1, __ARG_4
    set $I2, $P1
# for loop
.annotate 'line', 973
# i: $I3
    null $I3
 __label_12: # for condition
    ge $I3, $I2, __label_11
# {
.annotate 'line', 974
# argmark: $S3
    set $S6, $I3
    concat $S5, '{arg', $S6
    concat $S3, $S5, '}'
.annotate 'line', 975
# l: $I4
# predefined length
    length $I4, $S3
.annotate 'line', 976
# arg: $S4
    $S4 = __ARG_4[$I3]
 __label_14: # while
.annotate 'line', 977
# predefined indexof
    index $I1, $S1, $S3
    eq $I1, -1, __label_13
.annotate 'line', 978
# predefined replace
    replace $S1, $S1, $I1, $I4, $S4
    goto __label_14
 __label_13: # endwhile
# }
 __label_10: # for iteration
.annotate 'line', 973
    inc $I3
    goto __label_12
 __label_11: # for end
.annotate 'line', 980
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 981
    __ARG_1.'say'($S1)
# }
.annotate 'line', 982

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 939
    addattribute $P0, 'body'
.annotate 'line', 940
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
# Body
# {
.annotate 'line', 1003
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1004
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_0
.annotate 'line', 1005
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 1007
    setattribute self, 'body', __ARG_2
 __label_1: # endif
.annotate 'line', 1008
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1009
# n: $I1
    null $I1
.annotate 'line', 1010
    if_null __ARG_4, __label_2
# {
.annotate 'line', 1011
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
.annotate 'line', 1012
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_5
    set $S2, '!'
    if $S1 == $S2 goto __label_6
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 1014
    set $I1, -1
    goto __label_3 # break
 __label_6: # case
.annotate 'line', 1017
    set $I1, -2
.annotate 'line', 1018
    if_null __ARG_5, __label_7
.annotate 'line', 1019
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    'InternalError'($S3)
 __label_7: # endif
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 1022
    set $I1, 1
.annotate 'line', 1023
    if_null __ARG_5, __label_8
# {
.annotate 'line', 1024
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1025
    inc $I1
# }
 __label_8: # endif
.annotate 'line', 1027
    if_null __ARG_6, __label_9
# {
.annotate 'line', 1028
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1029
    inc $I1
# }
 __label_9: # endif
.annotate 'line', 1031
    if_null __ARG_7, __label_10
# {
.annotate 'line', 1032
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1033
    inc $I1
# }
 __label_10: # endif
 __label_3: # switch end
# }
 __label_2: # endif
.annotate 'line', 1037
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1038

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1041
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 1042
    .return($S1)
# }
.annotate 'line', 1043

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1046
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1047

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1048
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1051
# type: $S1
    null $S1
.annotate 'line', 1052
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
.annotate 'line', 1053
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 1054
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 1055
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 1056
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 1058
    'InternalError'('Invalid predef arg')
 __label_0: # switch end
.annotate 'line', 1060
    .return($S1)
# }
.annotate 'line', 1061

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1064
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1065
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1066
    isne $I1, $S1, 'v'
    unless $I1 goto __label_2
    iseq $I1, __ARG_4, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 1067
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
 __label_1: # endif
.annotate 'line', 1068
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1069
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1070

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 987
    addattribute $P0, 'name'
.annotate 'line', 988
    addattribute $P0, 'body'
.annotate 'line', 989
    addattribute $P0, 'typeresult'
.annotate 'line', 990
    addattribute $P0, 'type0'
.annotate 'line', 991
    addattribute $P0, 'type1'
.annotate 'line', 992
    addattribute $P0, 'type2'
.annotate 'line', 993
    addattribute $P0, 'type3'
.annotate 'line', 994
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
# Body
# {
.annotate 'line', 1082
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1083

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1073
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
# Body
# {
.annotate 'line', 1096
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1097
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1098

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1086
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1088
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1106
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1107

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1110
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1111
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_1
.annotate 'line', 1112
    'InternalError'("Invalid Predef_typecast.invoke call")
 __label_1: # endif
.annotate 'line', 1113
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1114
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 1115
    iseq $I1, $S2, $S1
    if $I1 goto __label_5
    isa $I1, $P1, [ 'IndexExpr' ]
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 1116
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 1118
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 1119
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1121
    ne $S3, 'null', __label_7
.annotate 'line', 1122
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_8
 __label_7: # else
.annotate 'line', 1124
    __ARG_1.'emitset'(__ARG_3, $S3)
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 1126

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1103
    addattribute $P0, 'type'
.end
.namespace [ ]

.sub 'Predef_say'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1131
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1132
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1133
    lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1134
# i: $I2
    null $I2
 __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1135
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_2: # for iteration
.annotate 'line', 1134
    inc $I2
    goto __label_4
 __label_3: # for end
.annotate 'line', 1136
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 1139
    __ARG_1.'emitsay'("''")
 __label_1: # endif
# }
.annotate 'line', 1140

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1144
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1145
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1146
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1147
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1148
    $P1 = __ARG_4[$I2]
    __ARG_1.'say'('    ', "print $P0, ", $P1)
 __label_0: # for iteration
.annotate 'line', 1147
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1149
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1150

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1154
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1155
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1156
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1157
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_0: # for iteration
.annotate 'line', 1156
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 1158

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1164
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1165
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 1166
    'SyntaxError'("invoke argument must be callable", __ARG_2)
 __label_0: # endif
.annotate 'line', 1167
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1168

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1172
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1173
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1174
# predefined length
    length $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1175

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1179
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1180
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1181
# predefined bytelength
    bytelength $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1182

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1186
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1187
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1188
# predefined ord
    ord $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1189

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1193
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1194
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1195
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1196
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1197
# predefined ord
    ord $I2, $S1, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1198

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1202
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1204
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1205
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1207
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1208
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1209

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1213
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1214
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1215
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1216
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1218
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1219
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1220

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1224
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1225
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1226
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1227
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 1228
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1229
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1231
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1232
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1233

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1237
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1238
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1239
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1240
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 1241
# predefined indexof
    index $I1, $S1, $S2
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1242

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1246
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1247
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1248
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1249
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1250
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 1251
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1252
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1253

.end # predefeval_indexof_pos


.sub 'getpredefs'
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
.annotate 'line', 1266
.const 'Sub' $P11 = 'Predef_print'
.annotate 'line', 1267
.const 'Sub' $P12 = 'Predef_say'
.annotate 'line', 1268
.const 'Sub' $P13 = 'Predef_cry'
.annotate 'line', 1269
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1271
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1272
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1273
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1271
    push $P1, $P16
.annotate 'line', 1276
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1277
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1271
    push $P1, $P20
.annotate 'line', 1280
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1281
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1271
    push $P1, $P24
.annotate 'line', 1284
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die {arg0}', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1271
    push $P1, $P28
.annotate 'line', 1288
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit {arg0}', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1271
    push $P1, $P30
.annotate 'line', 1292
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time {res}', 'I')
    set $P32, $P33
.annotate 'line', 1271
    push $P1, $P32
.annotate 'line', 1296
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time {res}', 'N')
    set $P34, $P35
.annotate 'line', 1271
    push $P1, $P34
.annotate 'line', 1300
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw {res}, {arg0}', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1271
    push $P1, $P36
.annotate 'line', 1304
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin {res}', 'P')
    set $P38, $P39
.annotate 'line', 1271
    push $P1, $P38
.annotate 'line', 1308
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout {res}', 'P')
    set $P40, $P41
.annotate 'line', 1271
    push $P1, $P40
.annotate 'line', 1312
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr {res}', 'P')
    set $P42, $P43
.annotate 'line', 1271
    push $P1, $P42
.annotate 'line', 1316
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0})\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1271
    push $P1, $P44
.annotate 'line', 1323
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new {res}, ['parrot';'FileHandle']\n{res}.'open'({arg0},{arg1})\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1271
    push $P1, $P46
.annotate 'line', 1330
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1271
    push $P1, $P48
.annotate 'line', 1337
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1271
    push $P1, $P50
.annotate 'line', 1345
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new {res}, ['parrot';'Exception']\n{res}['message'] = {arg0}\n{res}['severity'] = {arg1}\n{res}['type'] = {arg2}\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1271
    push $P1, $P52
.annotate 'line', 1354
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements {res}, {arg0}', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1271
    push $P1, $P54
.annotate 'line', 1358
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1359
    $P57.'PredefFunctionEval'('length', $P2, 'length {res}, {arg0}', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1271
    push $P1, $P56
.annotate 'line', 1363
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1364
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength {res}, {arg0}', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1271
    push $P1, $P58
.annotate 'line', 1368
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1369
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, {arg0}\nfind_encoding $I0, 'utf8'\ntrans_encoding {res}, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1271
    push $P1, $P60
.annotate 'line', 1377
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1378
    $P63.'PredefFunctionEval'('ord', $P5, 'ord {res}, {arg0}', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1271
    push $P1, $P62
.annotate 'line', 1382
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1383
    $P65.'PredefFunctionEval'('ord', $P6, 'ord {res}, {arg0}, {arg1}', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1271
    push $P1, $P64
.annotate 'line', 1387
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1388
    $P67.'PredefFunctionEval'('substr', $P7, 'substr {res}, {arg0}, {arg1}', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1271
    push $P1, $P66
.annotate 'line', 1392
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1393
    $P69.'PredefFunctionEval'('substr', $P8, 'substr {res}, {arg0}, {arg1}, {arg2}', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1271
    push $P1, $P68
.annotate 'line', 1397
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace {res}, {arg0}, {arg1}, {arg2}, {arg3}', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1271
    push $P1, $P70
.annotate 'line', 1401
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1402
    $P73.'PredefFunctionEval'('indexof', $P9, 'index {res}, {arg0}, {arg1}', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1271
    push $P1, $P72
.annotate 'line', 1406
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1407
    $P75.'PredefFunctionEval'('indexof', $P10, 'index {res}, {arg0}, {arg1}, {arg2}', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1271
    push $P1, $P74
.annotate 'line', 1411
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join {res}, {arg0}, {arg1}', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1271
    push $P1, $P76
.annotate 'line', 1415
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase {res}, {arg0}', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1271
    push $P1, $P78
.annotate 'line', 1419
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase {res}, {arg0}', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1271
    push $P1, $P80
.annotate 'line', 1423
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase {res}, {arg0}', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1271
    push $P1, $P82
.annotate 'line', 1427
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split {res}, {arg0}, {arg1}', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1271
    push $P1, $P84
.annotate 'line', 1431
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0})\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1271
    push $P1, $P86
.annotate 'line', 1438
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n{res} = $P0({arg0}, {arg1})\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1271
    push $P1, $P88
.annotate 'line', 1445
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push {arg0}, {arg1}', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1271
    push $P1, $P90
.annotate 'line', 1449
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt {res}, {arg0}', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1271
    push $P1, $P92
.annotate 'line', 1453
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow {res}, {arg0}, {arg1}', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1271
    push $P1, $P94
.annotate 'line', 1457
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp {res}, {arg0}', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1271
    push $P1, $P96
.annotate 'line', 1461
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln {res}, {arg0}', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1271
    push $P1, $P98
.annotate 'line', 1465
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin {res}, {arg0}', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1271
    push $P1, $P100
.annotate 'line', 1469
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos {res}, {arg0}', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1271
    push $P1, $P102
.annotate 'line', 1473
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan {res}, {arg0}', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1271
    push $P1, $P104
.annotate 'line', 1477
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin {res}, {arg0}', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1271
    push $P1, $P106
.annotate 'line', 1481
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos {res}, {arg0}', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1271
    push $P1, $P108
.annotate 'line', 1485
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan {res}, {arg0}', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1271
    push $P1, $P110
.annotate 'line', 1489
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan {res}, {arg0}, {arg1}', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1271
    push $P1, $P112
.annotate 'line', 1493
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp {res}', 'P')
    set $P114, $P115
.annotate 'line', 1271
    push $P1, $P114
.annotate 'line', 1497
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class {res}, {arg0}', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1271
    push $P1, $P116
.annotate 'line', 1501
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof {res}, {arg0}', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1271
    push $P1, $P118
.annotate 'line', 1505
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute {res}, {arg0}, {arg1}', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1271
    push $P1, $P120
.annotate 'line', 1509
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method {res}, {arg0}, {arg1}', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1271
    push $P1, $P122
.annotate 'line', 1513
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '{res} = {arg0}.{arg1}({arg2} :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1271
    push $P1, $P124
.annotate 'line', 1517
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone {res}, {arg0}', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1271
    push $P1, $P126
.annotate 'line', 1521
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg {res}, {arg0}', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1271
    push $P1, $P128
.annotate 'line', 1525
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg {arg0}, {arg1}', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1271
    push $P1, $P130
.annotate 'line', 1529
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language {arg0}\ncompreg {res}, {arg0}\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1271
    push $P1, $P132
.annotate 'line', 1536
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language {arg0}\ncompreg {res}, {arg1}\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1271
    push $P1, $P134
.annotate 'line', 1543
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib {res}, {arg0}', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1271
    push $P1, $P136
.annotate 'line', 1547
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode {arg0}', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1271
    push $P1, $P138
.annotate 'line', 1551
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc {res}, {arg0}, {arg1}, {arg2}', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1271
    push $P1, $P140
.annotate 'line', 1555
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1271
    push $P1, $P142
.annotate 'line', 1559
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf {res}, {arg0}, {arg1}', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1271
    push $P1, $P144
.annotate 'line', 1563
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1564
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1271
    push $P1, $P146
.annotate 'line', 1567
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1568
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1271
    push $P1, $P148
.annotate 'line', 1571
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1572
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1271
    push $P1, $P150
.annotate 'line', 1575
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1576
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1271
    push $P1, $P152
 __label_1: # Infinite loop
.annotate 'line', 1581
    .yield($P1)
    goto __label_1
 __label_0: # Infinite loop end
# }
.annotate 'line', 1582

.end # getpredefs


.sub 'findpredef'
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1586
    $P2 = 'getpredefs'()
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1587
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1588
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1589
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_5
.annotate 'line', 1590
    iseq $I2, $I1, -1
 __label_5:
    if $I2 goto __label_4
.annotate 'line', 1591
    iseq $I2, $I1, -2
    unless $I2 goto __label_6
    iseq $I2, __ARG_2, 1
 __label_6:
 __label_4:
    unless $I2 goto __label_3
.annotate 'line', 1592
    .return($P1)
 __label_3: # endif
# }
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P2
.annotate 'line', 1594
    .return($P2)
# }
.annotate 'line', 1595

.end # findpredef


.sub 'optimize_array'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1603
    if_null __ARG_1, __label_0
# {
.annotate 'line', 1604
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1605
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 1606
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
 __label_1: # for iteration
.annotate 'line', 1605
    inc $I2
    goto __label_3
 __label_2: # for end
# }
 __label_0: # endif
# }
.annotate 'line', 1608

.end # optimize_array


.sub 'parseDotted'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1612
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1613
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1614
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 1615
# predefined push
    push $P1, $P2
 __label_2: # while
.annotate 'line', 1616
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1617
    $P2 = __ARG_1.'get'()
.annotate 'line', 1618
# predefined push
    push $P1, $P2
# }
    goto __label_2
 __label_1: # endwhile
# }
 __label_0: # endif
.annotate 'line', 1621
    __ARG_1.'unget'($P2)
.annotate 'line', 1622
    .return($P1)
# }
.annotate 'line', 1623

.end # parseDotted


.sub 'toIdentifierList'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1627
    new $P1, ['ResizableStringArray']
.annotate 'line', 1628
    iter $P3, __ARG_1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 1629
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_0
 __label_1: # endfor
.annotate 'line', 1630
    .return($P1)
# }
.annotate 'line', 1631

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1644
    setattribute self, 'start', __ARG_1
.annotate 'line', 1645
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1646

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1649
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1650

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1653
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1654

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1657
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1658

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1661
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1662

.end # addlocalfunction


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1665
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1666

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1669
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1670

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1673
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1674

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1639
    addattribute $P0, 'start'
.annotate 'line', 1640
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 1689
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'args', $P2
# }
.annotate 'line', 1690

.end # init


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1694
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1695

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1698
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1699
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1700

.end # getarg


.sub 'parseargs' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1704
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1705
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1706
# {
.annotate 'line', 1707
# var value: $P3
    $P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1708
# predefined push
    push $P1, $P3
# }
 __label_2: # continue
.annotate 'line', 1709
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1710
    'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1711

.end # parseargs


.sub 'optimizeargs' :method
# Body
# {
.annotate 'line', 1715
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
# }
.annotate 'line', 1716

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1719
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1720
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1721
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1722
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1723
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 1724
# reg: $S1
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1725
# predefined push
    push $P2, $S1
# }
 __label_0: # for iteration
.annotate 'line', 1722
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1727
    .return($P2)
# }
.annotate 'line', 1728

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1731
# var argreg: $P1
    $P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1732
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1733

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1685
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1745
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1748
# nargs: $I1
    getattribute $P2, self, 'args'
    $P1 = $P2.'numargs'()
    set $I1, $P1
.annotate 'line', 1749
    .return($I1)
# }
.annotate 'line', 1750

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1753
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1754
    $P2 = $P1.'numargs'()
    set $I1, $P2
    ge __ARG_1, $I1, __label_0
.annotate 'line', 1755
    .tailcall $P1.'getarg'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 1757
    'InternalError'('Wrong modifier arg number')
 __label_1: # endif
# }
.annotate 'line', 1758

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1761
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1762
    if_null __ARG_2, __label_0
.annotate 'line', 1763
    setattribute self, 'args', __ARG_2
 __label_0: # endif
# }
.annotate 'line', 1764

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1767
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
# }
.annotate 'line', 1768

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1742
    addattribute $P0, 'name'
.annotate 'line', 1743
    addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1777
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1778
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1779
# {
.annotate 'line', 1780
    $P2 = __ARG_1.'get'()
.annotate 'line', 1781
# name: $S1
    $P4 = $P2.'getidentifier'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1782
    $P2 = __ARG_1.'get'()
.annotate 'line', 1783
# var args: $P3
    new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1784
    $P4 = $P2.'isop'('(')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1785
    $P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1786
    $P2 = __ARG_1.'get'()
# }
 __label_4: # endif
.annotate 'line', 1788
    new $P5, [ 'Modifier' ]
    $P5.'Modifier'($S1, $P3)
    set $P4, $P5
# predefined push
    push $P1, $P4
# }
 __label_2: # continue
.annotate 'line', 1789
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1790
    'RequireOp'(']', $P2)
.annotate 'line', 1791
    setattribute self, 'list', $P1
# }
.annotate 'line', 1792

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1795
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1796
    $P1.'optimize'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 1797

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1798
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1801
# var list: $P1
    getattribute $P1, self, 'list'
.annotate 'line', 1802
# n: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1803
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1804
# var mod: $P2
    $P2 = $P1[$I2]
.annotate 'line', 1805
    $P3 = $P2.'getname'()
    set $S1, $P3
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1806
    .return($P2)
# }
 __label_3: # endif
# }
 __label_0: # for iteration
.annotate 'line', 1803
    inc $I2
    goto __label_2
 __label_1: # for end
    null $P3
.annotate 'line', 1809
    .return($P3)
# }
.annotate 'line', 1810

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1773
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1819
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1820
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1821

.end # getparrotkey


.sub 'getparrotnamespacekey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1825
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_0
.annotate 'line', 1826
    .return(".namespace [ ]")
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 1828
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1829
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
 __label_1: # endif
# }
.annotate 'line', 1831

.end # getparrotnamespacekey


.sub 'parseUsing'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1835
# var taux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 1836
    $P2 = $P1.'iskeyword'('extern')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 1837
    new $P4, [ 'ExternStatement' ]
    $P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
    goto __label_1
 __label_0: # else
.annotate 'line', 1838
    $P5 = $P1.'iskeyword'('static')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 1839
    new $P7, [ 'StaticStatement' ]
    $P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 1841
    __ARG_2.'unget'($P1)
.annotate 'line', 1842
    new $P3, [ 'UsingStatement' ]
    $P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 1844

.end # parseUsing


.sub 'parseStatement'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1848
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1849
    $P3 = $P1.'isop'(';')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 1850
    new $P4, [ 'EmptyStatement' ]
    .return($P4)
 __label_0: # endif
.annotate 'line', 1851
    $P3 = $P1.'isop'('{')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1852
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_1: # endif
.annotate 'line', 1853
    $P3 = $P1.'isop'('${')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1854
    new $P5, [ 'PiropStatement' ]
    $P5.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_2: # endif
.annotate 'line', 1856
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
.annotate 'line', 1858
    .tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
 __label_6: # case
.annotate 'line', 1860
    .tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
    goto __label_3 # break
 __label_7: # case
.annotate 'line', 1863
    .tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
    goto __label_3 # break
 __label_8: # case
.annotate 'line', 1866
    .tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
 __label_9: # case
.annotate 'line', 1868
    .tailcall 'parseString'($P1, __ARG_1, __ARG_2)
 __label_10: # case
.annotate 'line', 1870
    .tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
 __label_11: # case
.annotate 'line', 1872
    .tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
 __label_12: # case
.annotate 'line', 1874
    new $P5, [ 'ReturnStatement' ]
    $P5.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_13: # case
.annotate 'line', 1876
    new $P7, [ 'YieldStatement' ]
    $P7.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
 __label_14: # case
.annotate 'line', 1878
    new $P9, [ 'GotoStatement' ]
    $P9.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P8, $P9
    .return($P8)
 __label_15: # case
.annotate 'line', 1880
    new $P11, [ 'IfStatement' ]
    $P11.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
 __label_16: # case
.annotate 'line', 1882
    new $P13, [ 'WhileStatement' ]
    $P13.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
 __label_17: # case
.annotate 'line', 1884
    new $P15, [ 'DoStatement' ]
    $P15.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
 __label_18: # case
.annotate 'line', 1886
    new $P17, [ 'ContinueStatement' ]
    $P17.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
 __label_19: # case
.annotate 'line', 1888
    new $P19, [ 'BreakStatement' ]
    $P19.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
 __label_20: # case
.annotate 'line', 1890
    new $P21, [ 'SwitchStatement' ]
    $P21.'SwitchStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
 __label_21: # case
.annotate 'line', 1892
    .tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
 __label_22: # case
.annotate 'line', 1894
    new $P23, [ 'ThrowStatement' ]
    $P23.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
 __label_23: # case
.annotate 'line', 1896
    new $P25, [ 'TryStatement' ]
    $P25.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
 __label_4: # default
.annotate 'line', 1898
    $P26 = $P1.'isidentifier'()
    if_null $P26, __label_24
    unless $P26 goto __label_24
# {
.annotate 'line', 1899
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1900
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_25
    unless $P3 goto __label_25
.annotate 'line', 1901
    new $P5, [ 'LabelStatement' ]
    $P5.'LabelStatement'($P1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_25: # endif
.annotate 'line', 1902
    __ARG_1.'unget'($P2)
# }
 __label_24: # endif
.annotate 'line', 1904
    __ARG_1.'unget'($P1)
.annotate 'line', 1905
    new $P4, [ 'ExprStatement' ]
    $P4.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P3, $P4
    .return($P3)
 __label_3: # switch end
.annotate 'line', 1907
    'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1908

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1918
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1919

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1920
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1923
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1924

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1927
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1928

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1931
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1932

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1935
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1936

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1939
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1940

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1943
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1944

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 1948
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1949

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1952
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1953

.end # createvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1956
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1957

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1960
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1961

.end # checkclass


.sub 'getouter' :method
# Body
# {
.annotate 'line', 1968
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 1969

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1972
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1973

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1976
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1977

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1980
    getattribute $P1, self, 'start'
    'InternalError'('**checking**', $P1)
.annotate 'line', 1982
    .return(self)
# }
.annotate 'line', 1983

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1914
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 1988
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1991
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1992

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1993
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 1986
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2006
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2007
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2008
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2009
# i: $I3
    null $I3
 __label_2: # for condition
    ge $I3, $I1, __label_1
# {
.annotate 'line', 2010
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2011
    set $I4, $I2
    unless $I4 goto __label_4
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
 __label_4:
    unless $I4 goto __label_3
.annotate 'line', 2012
    null $I2
 __label_3: # endif
.annotate 'line', 2013
    $P1[$I3] = $P2
# }
 __label_0: # for iteration
.annotate 'line', 2009
    inc $I3
    goto __label_2
 __label_1: # for end
.annotate 'line', 2015
    unless $I2 goto __label_5
.annotate 'line', 2016
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_6
 __label_5: # else
.annotate 'line', 2018
    .return(self)
 __label_6: # endif
# }
.annotate 'line', 2019

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2002
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2026
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2027
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2028

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2029
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2032
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2033
    .return(self)
# }
.annotate 'line', 2034

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2037
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 2038
    $P1.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 2039

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2022
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2044
    unless_null __ARG_1, __label_0
.annotate 'line', 2045
    .return(__ARG_2)
    goto __label_1
 __label_0: # else
.annotate 'line', 2046
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_2
.annotate 'line', 2047
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_3
 __label_2: # else
.annotate 'line', 2049
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 2050

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2063
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2064
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2065
# dotted: $I1
    null $I1
.annotate 'line', 2066
    $P4 = $P1.'isop'('.')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 2067
    set $I1, 1
.annotate 'line', 2068
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 2070
# opname: $S1
    $P4 = $P1.'getidentifier'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
 __label_1:
.annotate 'line', 2071
    unless $I1 goto __label_3
    set $S3, '.'
    goto __label_2
 __label_3:
    set $S3, ''
 __label_2:
    concat $S4, $S3, $S1
    box $P4, $S4
    setattribute self, 'opname', $P4
.annotate 'line', 2072
    $P1 = __ARG_2.'get'()
.annotate 'line', 2073
    $P4 = $P1.'isop'('}')
    isfalse $I2, $P4
    unless $I2 goto __label_4
# {
.annotate 'line', 2074
    __ARG_2.'unget'($P1)
.annotate 'line', 2075
# var args: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_5: # do
.annotate 'line', 2076
# {
.annotate 'line', 2077
# var arg: $P3
    null $P3
.annotate 'line', 2078
    $P1 = __ARG_2.'get'()
.annotate 'line', 2079
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_8
    unless $P4 goto __label_8
# {
.annotate 'line', 2080
    $P1 = __ARG_2.'get'()
.annotate 'line', 2081
# label: $S2
    $P4 = $P1.'getidentifier'()
    null $S2
    if_null $P4, __label_10
    set $S2, $P4
 __label_10:
.annotate 'line', 2082
    new $P4, [ 'Reflabel' ]
    $P4.'Reflabel'(__ARG_3, $S2)
    set $P3, $P4
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 2085
    __ARG_2.'unget'($P1)
.annotate 'line', 2086
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
 __label_9: # endif
.annotate 'line', 2088
# predefined push
    push $P2, $P3
# }
 __label_7: # continue
.annotate 'line', 2089
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 2090
    'RequireOp'('}', $P1)
.annotate 'line', 2091
    setattribute self, 'args', $P2
# }
 __label_4: # endif
.annotate 'line', 2093
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2094

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2097
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 2098
    .return(self)
# }
.annotate 'line', 2099

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2102
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2103
    self.'annotate'(__ARG_1)
.annotate 'line', 2104
    concat $S3, 'pirop ', $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 2105
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2106
    __ARG_1.'print'('    ')
.annotate 'line', 2107
    unless_null $P1, __label_1
.annotate 'line', 2108
    __ARG_1.'say'($S1)
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2110
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2111
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 2112
# i: $I2
    null $I2
 __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 2113
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 2114
# reg: $S2
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
 __label_6:
.annotate 'line', 2115
# predefined push
    push $P2, $S2
# }
 __label_3: # for iteration
.annotate 'line', 2112
    inc $I2
    goto __label_5
 __label_4: # for end
.annotate 'line', 2117
# predefined join
    join $S3, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S3)
# }
 __label_2: # endif
# }
.annotate 'line', 2119

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2056
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2058
    addattribute $P0, 'opname'
.annotate 'line', 2059
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2131
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2132
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2133
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2134
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2135
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2136
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2137
    .return(self)
# }
.annotate 'line', 2138

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2139
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2142
    self.'annotate'(__ARG_1)
.annotate 'line', 2143
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2144

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2126
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2128
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2156
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2157
# sym: $S1
    $P1 = __ARG_2.'get'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2158
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2159
    box $P1, $S1
    setattribute self, 'symbol', $P1
# }
.annotate 'line', 2160

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2161
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2164
    self.'annotate'(__ARG_1)
.annotate 'line', 2165
# var v: $P1
    getattribute $P2, self, 'symbol'
    $P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2166
    $P2 = $P1.'getreg'()
    getattribute $P3, self, 'symbol'
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2167

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2151
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2153
    addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2181
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2182
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2183
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2184
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2185
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2186
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
# }
.annotate 'line', 2187

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2190
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2191
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2192
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2194
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
.annotate 'line', 2195
    if_null $P3, __label_0
# {
.annotate 'line', 2196
    isa $I1, $P3, [ 'FunctionStatement' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2197
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2198
    box $P4, $S2
    setattribute self, 'subid', $P4
# }
 __label_1: # endif
# }
 __label_0: # endif
.annotate 'line', 2201
    .return(self)
# }
.annotate 'line', 2202

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2205
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2206
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2207
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2208
    getattribute $P3, self, 'subid'
    if_null $P3, __label_0
# {
.annotate 'line', 2209
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2210
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2213
    self.'annotate'(__ARG_1)
.annotate 'line', 2214
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2215
    $P1.'pop'()
.annotate 'line', 2216
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 2218
    __ARG_1.'say'("'", $S1, "'")
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 2221
    $P3 = 'getparrotkey'($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
 __label_3: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2224

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2174
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2176
    addattribute $P0, 'path'
.annotate 'line', 2177
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2236
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2237
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2238
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2239

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2242
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2243
    .return(self)
# }
.annotate 'line', 2244

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2247
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2248

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2231
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2233
    addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param pmc __ARG_5 :optional
# Body
# {
.annotate 'line', 2267
    setattribute self, 'type', __ARG_1
.annotate 'line', 2268
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2269
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2270
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2271
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2272

.end # VarData


.sub 'setid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2275
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2276

.end # setid


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2279
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2280

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2281
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2282
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2283
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2284
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2285
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
# Body
# {
.annotate 'line', 2286
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2287
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2288
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2257
    addattribute $P0, 'type'
.annotate 'line', 2258
    addattribute $P0, 'reg'
.annotate 'line', 2259
    addattribute $P0, 'scope'
.annotate 'line', 2260
    addattribute $P0, 'flags'
.annotate 'line', 2261
    addattribute $P0, 'value'
.annotate 'line', 2262
    addattribute $P0, 'id'
.annotate 'line', 2263
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2296
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2297

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 2300
    'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2301

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2293
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2310
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2311

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2314
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2315
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2316
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2317
    if_null $P2, __label_1
.annotate 'line', 2318
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    'SyntaxError'($S3, __ARG_1)
 __label_1: # endif
.annotate 'line', 2319
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2320
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2321
    $P1[$S1] = $P3
.annotate 'line', 2322
    .return($P3)
# }
.annotate 'line', 2323

.end # createvar


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
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
    if_null $P2, __label_1
.annotate 'line', 2330
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2331
    new $P4, [ 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2332

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 2336
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2337
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2338
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2339
    if_null $P2, __label_1
.annotate 'line', 2340
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2341
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P5, [ 'ConstantInternalFail' ]
    $P5.'ConstantInternalFail'(__ARG_1)
    set $P4, $P5
.annotate 'line', 2342
    $P3.'VarData'(__ARG_2, $P4, self, __ARG_5, __ARG_3)
.annotate 'line', 2343
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_3
    isne $I1, __ARG_4, ''
 __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2344
    $P3.'setid'(__ARG_4)
 __label_2: # endif
.annotate 'line', 2345
    $P1[$S1] = $P3
# }
.annotate 'line', 2346

.end # createconst


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2349
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2350
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2351
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2352
    isnull $I1, $P2
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 2353
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
 __label_1: # endif
.annotate 'line', 2354
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2355
    'InternalError'('Incorrect data for Variable', __ARG_1)
 __label_3: # endif
.annotate 'line', 2356
    .return($P2)
# }
.annotate 'line', 2357

.end # getvar


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2360
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2361
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2362
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2363
    .return($P2)
# }
.annotate 'line', 2364

.end # getlocalvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2367
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2368
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2369
    .return($S1)
# }
.annotate 'line', 2370

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2373
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2375
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2376
    .return('__WLEX_self')
# }
.annotate 'line', 2377

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2307
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2386
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2398
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2399

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2400
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2401
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2402
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2403
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2404
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2405
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2406
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2407
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2408
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2411
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2412

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2416
    .return(self)
# }
.annotate 'line', 2417

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2418
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2421
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2422
# reg: $S2
    ne $S1, 'v', __label_2
    set $S2, ''
    goto __label_1
 __label_2:
    $S2 = self.'tempreg'($S1)
 __label_1:
.annotate 'line', 2423
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2424
    .return($S2)
# }
.annotate 'line', 2425

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2428
# reg: $S1
    null $S1
.annotate 'line', 2429
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_0
.annotate 'line', 2430
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2432
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2433
    self.'emit'(__ARG_1, $S1)
# }
 __label_1: # endif
.annotate 'line', 2435
    .return($S1)
# }
.annotate 'line', 2436

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2439
    getattribute $P1, self, 'start'
    'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2440

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2394
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2445
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2443
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2455
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2456
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2457
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 2458
    'SyntaxError'('anonymous function expected', $P1)
 __label_0: # endif
.annotate 'line', 2459
    new $P4, [ 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2460

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2461
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2464
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2465
    .return(self)
# }
.annotate 'line', 2466

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2469
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2470
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2471
    self.'annotate'(__ARG_1)
.annotate 'line', 2472
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2473
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 2474
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 2475

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2450
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2452
    addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2490
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2491
    .return(self)
# }
.annotate 'line', 2492

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2495
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2496

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2499
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2500
    .return(self)
# }
.annotate 'line', 2501

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2504
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2505
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 2506
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 2508
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2509
    ne $I1, 0, __label_4
.annotate 'line', 2510
    .return(2)
    goto __label_5
 __label_4: # else
.annotate 'line', 2512
    .return(1)
 __label_5: # endif
 __label_2: # default
 __label_1: # switch end
# }
 __label_0: # endif
.annotate 'line', 2515
    .return(0)
# }
.annotate 'line', 2516

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2519
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2521
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2522
    isa $I1, $P1, [ 'NullCheckerExpr' ]
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2523
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2525
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2526
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2527
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
.annotate 'line', 2530
    __ARG_1.'emitif_null'($S1, __ARG_3)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2533
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2536
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2539

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2542
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2544
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2545
    isa $I1, $P1, [ 'NullCheckerExpr' ]
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2546
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2548
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2549
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2550
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
.annotate 'line', 2553
    __ARG_1.'emitif_null'($S1, __ARG_2)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2556
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2559
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2562

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2487
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2569
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2570
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2567
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2580
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2581
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2582

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2583
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2584
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2587
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2588
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2589
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2590
# need_unicode: $I2
    null $I2
.annotate 'line', 2591
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $I3, $P3
# {
.annotate 'line', 2592
    le $I3, 127, __label_3
# {
.annotate 'line', 2593
    set $I2, 1
    goto __label_2 # break
.annotate 'line', 2594
# }
 __label_3: # endif
# }
    goto __label_1
 __label_2: # endfor
.annotate 'line', 2597
    unless $I2 goto __label_4
# {
.annotate 'line', 2598
    unless $I1 goto __label_5
# {
.annotate 'line', 2599
    null $I1
.annotate 'line', 2600
# saux: $S2
    set $S2, $S1
.annotate 'line', 2601
    set $S1, ''
.annotate 'line', 2602
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
 __label_6: # for iteration
    unless $P4 goto __label_7
    shift $S3, $P4
# {
.annotate 'line', 2603
    ne $S3, '\', __label_8
.annotate 'line', 2604
    set $S3, '\\'
 __label_8: # endif
.annotate 'line', 2605
    concat $S1, $S1, $S3
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 2608
# result: $S4
    set $S4, ''
.annotate 'line', 2609
# l: $I4
# predefined length
    length $I4, $S1
# for loop
.annotate 'line', 2610
# i: $I5
    null $I5
 __label_11: # for condition
    ge $I5, $I4, __label_10
# {
.annotate 'line', 2611
# c: $S5
# predefined substr
    substr $S5, $S1, $I5, 1
.annotate 'line', 2612
# n: $I6
# predefined ord
    ord $I6, $S5
.annotate 'line', 2613
    le $I6, 127, __label_12
# {
.annotate 'line', 2614
# h: $S6
    box $P5, $I6
    $P2 = $P5.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
 __label_14:
.annotate 'line', 2615
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 2618
    concat $S4, $S4, $S5
 __label_13: # endif
# }
 __label_9: # for iteration
.annotate 'line', 2610
    inc $I5
    goto __label_11
 __label_10: # for end
.annotate 'line', 2620
    set $S1, $S4
# }
 __label_4: # endif
.annotate 'line', 2622
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
 __label_16:
    set $S7, '"'
 __label_15:
.annotate 'line', 2623
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2624
    unless $I2 goto __label_17
.annotate 'line', 2625
    concat $S0, 'unicode:', $S1
    set $S1, $S0
 __label_17: # endif
.annotate 'line', 2626
    .return($S1)
# }
.annotate 'line', 2627

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2630
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2631
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2632
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2633
# var s: $P2
    box $P2, $S1
.annotate 'line', 2634
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
 __label_1: # endif
.annotate 'line', 2636
    .return($S1)
# }
.annotate 'line', 2637

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2640
    set $S1, __ARG_2
    eq $S1, '', __label_0
.annotate 'line', 2641
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
 __label_0: # endif
# }
.annotate 'line', 2642

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2645
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2646

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2575
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2577
    addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param int __ARG_4 :opt_flag
# Body
# {
.annotate 'line', 2658
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2659
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2660
# n: $I1
    null $I1
.annotate 'line', 2661
    unless __ARG_4 goto __label_0
.annotate 'line', 2662
    set $I1, __ARG_3
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2664
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 2665
    set $I1, $S1
# }
 __label_1: # endif
.annotate 'line', 2667
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2668

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2669
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2670
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2673
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2674
# i: $I1
    set $S2, $S1
    set $I1, $S2
.annotate 'line', 2675
    .return($I1)
# }
.annotate 'line', 2676

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2679
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2680
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2681
    ne $I1, 0, __label_1
.annotate 'line', 2682
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
 __label_1: # else
.annotate 'line', 2684
    __ARG_1.'emitset'(__ARG_2, $I1)
 __label_2: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 2686

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2689
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2690

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2651
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2653
    addattribute $P0, 'pos'
.annotate 'line', 2654
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2700
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2701
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2702

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2703
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2704
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2707
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2708
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2709
    assign $P1, $S1
.annotate 'line', 2710
    .return($P1)
# }
.annotate 'line', 2711

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2714
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2715
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2716
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
 __label_0: # endif
# }
.annotate 'line', 2718

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2723
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2724
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 2725
    concat $S1, $S1, '.0'
 __label_1: # endif
.annotate 'line', 2726
    .return($S1)
# }
.annotate 'line', 2727

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2695
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2697
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2735
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2738
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2739
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2740

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2743
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2744

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2747
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2748
    if_null $P1, __label_0
.annotate 'line', 2749
    .tailcall $P1.'gettype'()
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2751
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
.annotate 'line', 2754
    .return('P')
 __label_3: # default
.annotate 'line', 2756
    .return('')
 __label_2: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2759

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2762
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2763
    .return($S1)
# }
.annotate 'line', 2764

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2767
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2768
    unless_null $P1, __label_0
.annotate 'line', 2769
    'InternalError'('Bad thing')
 __label_0: # endif
.annotate 'line', 2770
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2771
# s: $S1
    null $S1
.annotate 'line', 2772
    unless_null $P2, __label_1
# {
.annotate 'line', 2773
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
 __label_3:
.annotate 'line', 2774
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_6
    set $S4, 'null'
    if $S3 == $S4 goto __label_7
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 2776
    set $S1, 'self'
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 2778
    set $S1, 'null'
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 2780
    set $S1, ''
 __label_4: # switch end
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2784
    $P3 = $P2.'getid'()
    if_null $P3, __label_8
.annotate 'line', 2785
    .tailcall $P2.'getid'()
    goto __label_9
 __label_8: # else
.annotate 'line', 2787
    $P4 = $P2.'getreg'()
    set $S1, $P4
 __label_9: # endif
# }
 __label_2: # endif
.annotate 'line', 2789
    .return($S1)
# }
.annotate 'line', 2790

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2793
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2794
    set $S2, $P1
    ne $S2, '', __label_0
# {
.annotate 'line', 2795
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
 __label_1:
.annotate 'line', 2796
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    'SyntaxError'($S2, $P2)
# }
 __label_0: # endif
.annotate 'line', 2798
    .return($P1)
# }
.annotate 'line', 2799

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2802
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2803
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2804
    if_null $P2, __label_0
# {
.annotate 'line', 2805
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_2
    $P3 = $P2.'getid'()
    isnull $I2, $P3
 __label_2:
    unless $I2 goto __label_1
.annotate 'line', 2806
    .tailcall $P2.'getvalue'()
 __label_1: # endif
.annotate 'line', 2807
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2808
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2809
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2810
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
 __label_4: # endif
# }
 __label_3: # endif
# }
 __label_0: # endif
.annotate 'line', 2813
    .return(self)
# }
.annotate 'line', 2814

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2817
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2818
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2819
# flags: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
 __label_2:
    $I1 = $P1.'getflags'()
 __label_1:
.annotate 'line', 2820
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2821
    band $I3, $I1, 2
    unless $I3 goto __label_4
# {
.annotate 'line', 2822
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
 __label_5:
.annotate 'line', 2823
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
 __label_7:
    unless $I2 goto __label_6
.annotate 'line', 2824
    __ARG_1.'emitfind_lex'($S1, $S2)
 __label_6: # endif
# }
 __label_4: # endif
# }
 __label_3: # endif
.annotate 'line', 2827
    .return($S1)
# }
.annotate 'line', 2828

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2831
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2832
    self.'annotate'(__ARG_1)
.annotate 'line', 2833
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2834
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2836

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2839
    self.'annotate'(__ARG_1)
.annotate 'line', 2840
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2841
    .return($S1)
# }
.annotate 'line', 2842

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2845
    self.'annotate'(__ARG_1)
.annotate 'line', 2846
    $P1 = self.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# predefined die
.annotate 'line', 2847
    die "NO"
 __label_0: # endif
.annotate 'line', 2848
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2849
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 2850
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
# {
.annotate 'line', 2851
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_7
    set $S6, 'P'
    if $S5 == $S6 goto __label_8
    goto __label_6
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2854
    __ARG_1.'emitnull'($S2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2857
    getattribute $P2, self, 'start'
    'SyntaxError'("Can't assign null to that type", $P2)
 __label_5: # switch end
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 2860
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_9
.annotate 'line', 2861
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 2863
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_11
    set $S3, $P1
 __label_11:
.annotate 'line', 2864
    ne $S3, 'v', __label_12
.annotate 'line', 2865
    getattribute $P1, self, 'start'
    'SyntaxError'("Can't assign from void expression", $P1)
 __label_12: # endif
.annotate 'line', 2866
    ne $S1, $S3, __label_13
# {
.annotate 'line', 2867
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 2870
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_15
    set $S4, $P1
 __label_15:
.annotate 'line', 2871
    self.'annotate'(__ARG_1)
.annotate 'line', 2872
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_18
    isne $I1, $S3, 'P'
 __label_18:
    unless $I1 goto __label_16
.annotate 'line', 2873
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_17
 __label_16: # else
.annotate 'line', 2875
    __ARG_1.'emitset'($S2, $S4)
 __label_17: # endif
# }
 __label_14: # endif
# }
 __label_10: # endif
 __label_4: # endif
.annotate 'line', 2878
    .return($S2)
# }
.annotate 'line', 2879

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2732
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2734
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2889
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2890
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2891

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2892
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2895
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2896
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2897
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 2898
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 2899
    .return($S2)
# }
.annotate 'line', 2900

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2903
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2904
    self.'annotate'(__ARG_1)
.annotate 'line', 2905
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2906
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2908

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2911
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2912
    $P2 = __ARG_2.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2913
    __ARG_1.'emitnull'($S1)
    goto __label_2
 __label_1: # else
.annotate 'line', 2914
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 2915
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 2917
# typeright: $S2
    $P3 = __ARG_2.'checkresult'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 2918
    ne 'P', $S2, __label_6
# {
.annotate 'line', 2919
    __ARG_2.'emit'(__ARG_1, $S1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 2922
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
 __label_8:
.annotate 'line', 2923
    self.'annotate'(__ARG_1)
.annotate 'line', 2924
    __ARG_1.'emitbox'($S1, $S3)
# }
 __label_7: # endif
# }
 __label_4: # endif
 __label_2: # endif
.annotate 'line', 2928
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2929
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 2930
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2931

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2884
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2886
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2940
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2941

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2936
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2952
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2953
    $P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2954

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2955
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2958
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 2961
    set $S1, __ARG_2
    ne $S1, '', __label_0
.annotate 'line', 2962
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
 __label_0: # endif
.annotate 'line', 2963
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 2964
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2965
    __ARG_1.'say'()
# }
.annotate 'line', 2966

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2946
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2948
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2976
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2977
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 2978

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 2981
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 2982

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2985
    self.'optimizearg'()
.annotate 'line', 2986
    .return(self)
# }
.annotate 'line', 2987

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2971
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2973
    addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 2998
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2999
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3000
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3001

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3004
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3005
    .return(self)
# }
.annotate 'line', 3006

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3009
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3010

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3013
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3014
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3015

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3018
    self.'optimizearg'()
.annotate 'line', 3019
    .return(self)
# }
.annotate 'line', 3020

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3023
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3024
    .return($S1)
# }
.annotate 'line', 3025

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3028
# reg: $S1
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3029
    .return($S1)
# }
.annotate 'line', 3030

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 2992
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2994
    addattribute $P0, 'lexpr'
.annotate 'line', 2995
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3039
    .return('I')
# }
.annotate 'line', 3040

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3043
    self.'optimizearg'()
.annotate 'line', 3044
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3045
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3046
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3047
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3048
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3049
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3051
    .return(self)
# }
.annotate 'line', 3052

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3035
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3061
    .return('I')
# }
.annotate 'line', 3062

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3057
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3070
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3071

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3074
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3075
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 3076
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3077
    self.'annotate'(__ARG_1)
.annotate 'line', 3078
    __ARG_1.'print'('    delete ')
.annotate 'line', 3079
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3080
    __ARG_1.'say'()
.annotate 'line', 3081
    set $S1, __ARG_2
    eq $S1, '', __label_3
.annotate 'line', 3082
    __ARG_1.'emitset'(__ARG_2, '1')
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 3085
    getattribute $P2, self, 'start'
    'SyntaxError'("delete with invalid operator", $P2)
 __label_1: # endif
# }
.annotate 'line', 3086

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3066
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3093
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3094

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3097
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3098
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
.annotate 'line', 3099
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_5
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3100
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3101
    self.'annotate'(__ARG_1)
.annotate 'line', 3102
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3103
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3104
    __ARG_1.'say'()
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 3107
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_4: # endif
# }
.annotate 'line', 3108

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3111
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3112
# reg: $S1
    $P2 = self.'tempreg'('I')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 3113
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3114
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3115
    self.'annotate'(__ARG_1)
.annotate 'line', 3116
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3117
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3118
    __ARG_1.'say'()
.annotate 'line', 3119
    .return($S1)
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 3122
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_2: # endif
# }
.annotate 'line', 3123

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3089
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3132
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3133

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3136
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3137

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3140
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3141
    .return(self)
# }
.annotate 'line', 3142

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3145
    self.'optimizearg'()
.annotate 'line', 3146
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3147
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3148
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3149
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $I2, $I1
    .tailcall 'integerValue'($P3, $P5, $I2)
# }
 __label_0: # endif
# {
.annotate 'line', 3152
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3153
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3154
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3155
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $N2, $N1
    .tailcall 'floatValue'($P3, $P5, $N2)
# }
 __label_1: # endif
# }
.annotate 'line', 3158
    .return(self)
# }
.annotate 'line', 3159

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3162
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3163
    self.'annotate'(__ARG_1)
.annotate 'line', 3164
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3165

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3128
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3174
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3175

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3176
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3179
    .return('I')
# }
.annotate 'line', 3180

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3183
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3184
    .return(self)
# }
.annotate 'line', 3185

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3188
    self.'optimizearg'()
.annotate 'line', 3189
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3190
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3191
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3192
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3193
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall 'integerValue'($P3, $P4, $I2)
# }
 __label_0: # endif
.annotate 'line', 3195
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3196
    .tailcall $P1.'negated'()
 __label_1: # endif
.annotate 'line', 3197
    .return(self)
# }
.annotate 'line', 3198

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3201
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3202

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3205
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3206
    self.'annotate'(__ARG_1)
.annotate 'line', 3207
# type: $S2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3208
    set $S3, $S2
    set $S4, 'I'
    if $S3 == $S4 goto __label_4
    set $S4, 'P'
    if $S3 == $S4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 3210
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 3213
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 3216
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
 __label_2: # switch end
# }
.annotate 'line', 3218

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3170
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3227
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3228

.end # OpPreIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3231
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3232

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3235
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3236
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3237
    .return(self)
# }
.annotate 'line', 3238

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3241
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3242
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3243
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3244

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3247
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3248
    self.'annotate'(__ARG_1)
.annotate 'line', 3249
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3250
    .return($S1)
# }
.annotate 'line', 3251

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3223
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3260
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3261
    .return(self)
# }
.annotate 'line', 3262

.end # OpPostIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3265
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3266

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3269
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3270
    self.'annotate'(__ARG_1)
.annotate 'line', 3271
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3272
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3273
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3274
    .return($S1)
# }
.annotate 'line', 3275

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3256
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3284
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3285

.end # OpPreDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3288
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3289

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3292
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3293
    .return(self)
# }
.annotate 'line', 3294

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3297
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3298
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3299
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3300

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3303
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3304
    self.'annotate'(__ARG_1)
.annotate 'line', 3305
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3306
    .return($S1)
# }
.annotate 'line', 3307

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3280
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3316
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3317
    .return(self)
# }
.annotate 'line', 3318

.end # OpPostDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3321
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3322

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3325
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3326
    self.'annotate'(__ARG_1)
.annotate 'line', 3327
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3328
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3329
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3330
    .return($S1)
# }
.annotate 'line', 3331

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3312
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3342
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3343
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3344
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3345
    .return(self)
# }
.annotate 'line', 3346

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3349
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3350

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3353
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3354
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3355
    .return(self)
# }
.annotate 'line', 3356

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3359
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3360

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3363
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3364
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3365
    self.'annotate'(__ARG_1)
.annotate 'line', 3366
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_1: # endif
# }
.annotate 'line', 3368

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3336
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3338
    addattribute $P0, 'lexpr'
.annotate 'line', 3339
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3377
    self.'annotate'(__ARG_1)
.annotate 'line', 3378
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3379
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3380

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3373
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3389
    self.'annotate'(__ARG_1)
.annotate 'line', 3390
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3391
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_2
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3392
    __ARG_1.'emitassign'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3393

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3396
    self.'annotate'(__ARG_1)
.annotate 'line', 3397
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3398
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3399
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3400
    .return($S1)
# }
.annotate 'line', 3401

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3385
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3410
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3411
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3412
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3413
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3414
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3415
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_5
    isa $I1, $P2, [ 'ConcatString' ]
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 3416
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3418
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_6
    set $S4, $P3
 __label_6:
.annotate 'line', 3419
# aux: $S5
    null $S5
.annotate 'line', 3420
    self.'annotate'(__ARG_1)
.annotate 'line', 3421
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
.annotate 'line', 3423
    eq $S2, 'S', __label_12
# {
.annotate 'line', 3424
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3425
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3426
    set $S4, $S5
# }
 __label_12: # endif
.annotate 'line', 3428
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
.annotate 'line', 3432
    eq $S1, $S2, __label_13
# {
.annotate 'line', 3433
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3434
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3435
    set $S4, $S5
# }
 __label_13: # endif
.annotate 'line', 3437
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 3440
    __ARG_1.'emitaddto'($S3, $S4)
 __label_7: # switch end
# }
 __label_4: # endif
.annotate 'line', 3443
    .return($S3)
# }
.annotate 'line', 3444

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3406
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3453
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3454
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3455
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3456
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3457
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3458
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 3459
# aux: $S5
    null $S5
.annotate 'line', 3460
    self.'annotate'(__ARG_1)
.annotate 'line', 3461
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
.annotate 'line', 3463
    getattribute $P3, self, 'start'
    'SyntaxError'("-= can't be applied to string", $P3)
 __label_7: # case
 __label_8: # case
.annotate 'line', 3466
    eq $S1, $S2, __label_9
# {
.annotate 'line', 3467
    $P4 = self.'tempreg'($S1)
    set $S5, $P4
.annotate 'line', 3468
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3469
    set $S4, $S5
# }
 __label_9: # endif
.annotate 'line', 3471
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 3474
    __ARG_1.'emitsubto'($S3, $S4)
 __label_4: # switch end
.annotate 'line', 3476
    .return($S3)
# }
.annotate 'line', 3477

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3449
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3486
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3487
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3488
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3489
# rreg: $S4
    null $S4
.annotate 'line', 3490
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 3492
    ne $S2, 'I', __label_6
.annotate 'line', 3493
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 3495
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3496
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
 __label_7: # endif
.annotate 'line', 3498
    self.'annotate'(__ARG_1)
.annotate 'line', 3499
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 3502
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3503
    self.'annotate'(__ARG_1)
.annotate 'line', 3504
    __ARG_1.'emitarg2'('mul', $S3, $S4)
 __label_3: # switch end
.annotate 'line', 3506
    .return($S3)
# }
.annotate 'line', 3507

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3482
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3516
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3517
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3518
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3519
    self.'annotate'(__ARG_1)
.annotate 'line', 3520
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3521
    .return($S2)
# }
.annotate 'line', 3522

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3512
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3531
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3532
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3533
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3534
    self.'annotate'(__ARG_1)
.annotate 'line', 3535
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3536
    .return($S2)
# }
.annotate 'line', 3537

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3527
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3544
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3547
    self.'optimizearg'()
.annotate 'line', 3548
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3549
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3550
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3551
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3552
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3553
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3555
    .return(self)
# }
.annotate 'line', 3556

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3559
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3560
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3561
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3562
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
 __label_3:
.annotate 'line', 3563
    self.'annotate'(__ARG_1)
.annotate 'line', 3564
# aux: $S5
    null $S5
.annotate 'line', 3565
    iseq $I1, $S1, 'N'
    if $I1 goto __label_6
    iseq $I1, $S2, 'N'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3567
    ne $S1, 'I', __label_7
# {
.annotate 'line', 3568
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3569
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3570
    set $S3, $S5
# }
 __label_7: # endif
.annotate 'line', 3572
    ne $S2, 'I', __label_8
# {
.annotate 'line', 3573
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3574
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3575
    set $S4, $S5
# }
 __label_8: # endif
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 3578
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
 __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 3579
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3580
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3581
    set $S3, $S5
# }
    goto __label_10
 __label_9: # else
.annotate 'line', 3583
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 3584
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3585
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3586
    set $S4, $S5
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 3588
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'P'
 __label_17:
    unless $I1 goto __label_15
# {
.annotate 'line', 3589
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3590
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3591
    set $S3, $S5
# }
    goto __label_16
 __label_15: # else
.annotate 'line', 3593
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_19
    iseq $I1, $S1, 'S'
 __label_19:
    unless $I1 goto __label_18
# {
.annotate 'line', 3594
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3595
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3596
    set $S4, $S5
# }
 __label_18: # endif
 __label_16: # endif
 __label_13: # endif
 __label_10: # endif
 __label_5: # endif
.annotate 'line', 3599
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
.annotate 'line', 3601
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_23: # case
.annotate 'line', 3604
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_24: # case
.annotate 'line', 3607
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_21: # default
 __label_20: # switch end
.annotate 'line', 3608
# }
.annotate 'line', 3610

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3613
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3614

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3617
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3618

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3621
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3622

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3542
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 3637
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3638
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3639
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3640

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3641
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3642
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3645
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3646
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3647
    .return(self)
# }
.annotate 'line', 3648

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3651
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3652
    self.'annotate'(__ARG_1)
.annotate 'line', 3653
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3654
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3655
    __ARG_1.'emitarg1'('not', __ARG_2)
 __label_1: # endif
# }
.annotate 'line', 3656

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3659
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3660
    self.'annotate'(__ARG_1)
.annotate 'line', 3661
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
.annotate 'line', 3662

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3630
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3632
    addattribute $P0, 'expr'
.annotate 'line', 3633
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3669
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3672
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3673

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3676
    self.'optimizearg'()
.annotate 'line', 3677
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3678
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3679
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3680
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3681
    unless $I1 goto __label_0
# {
.annotate 'line', 3682
    unless $I2 goto __label_1
.annotate 'line', 3683
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
 __label_1: # else
.annotate 'line', 3685
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3687
    unless $I2 goto __label_3
.annotate 'line', 3688
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3689
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3690
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3691
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3692
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3693
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3695
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3696
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3697
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3699
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3700
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3701
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    iseq $I6, $S3, $S4
    .tailcall 'integerValue'($P11, $P12, $I6)
 __label_10: # default
 __label_9: # switch end
# }
 __label_8: # endif
# }
 __label_4: # endif
.annotate 'line', 3705
    .return(self)
# }
.annotate 'line', 3706

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3709
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3710

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3713
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3714

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3717
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3718

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3721
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3722

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3667
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3729
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3732
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3733

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3736
    self.'optimizearg'()
.annotate 'line', 3737
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3738
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3739
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3740
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3741
    unless $I1 goto __label_0
# {
.annotate 'line', 3742
    unless $I2 goto __label_1
.annotate 'line', 3743
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
 __label_1: # else
.annotate 'line', 3745
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3747
    unless $I2 goto __label_3
.annotate 'line', 3748
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3749
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3750
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3751
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3752
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3753
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3755
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3756
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3757
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3759
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3760
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3761
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    isne $I6, $S3, $S4
    .tailcall 'integerValue'($P11, $P12, $I6)
 __label_10: # default
 __label_9: # switch end
# }
 __label_8: # endif
# }
 __label_4: # endif
.annotate 'line', 3765
    .return(self)
# }
.annotate 'line', 3766

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3769
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3770

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3773
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3774

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3777
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3778

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3781
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3782

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3727
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
# Body
# {
.annotate 'line', 3792
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3793
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3794

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3795
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3798
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3799
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
.annotate 'line', 3800

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3803
    getattribute $P1, self, 'positive'
    if_null $P1, __label_1
    unless $P1 goto __label_1
    iseq $I1, __ARG_1, __ARG_2
    goto __label_0
 __label_1:
    isne $I1, __ARG_1, __ARG_2
 __label_0:
    .return($I1)
# }
.annotate 'line', 3804

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3807
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3808
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
 __label_1:
    set $S1, 'isntsame'
 __label_0:
.annotate 'line', 3809
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3810

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3813
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3814

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3817
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3818
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
 __label_1:
    set $S1, 'ne_addr'
 __label_0:
.annotate 'line', 3819
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3820

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3823
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3824
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
 __label_1:
    set $S1, 'eq_addr'
 __label_0:
.annotate 'line', 3825
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3826

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3787
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3789
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3833
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3836
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3837

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3840
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3841

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3844
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3845

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3848
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3849

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3852
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3853

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3831
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3860
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3863
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3864

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3867
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3868

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3871
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3872

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3875
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3876

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3879
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3880

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3858
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3887
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3890
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3891

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3894
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3895

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3898
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3899

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3902
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3903

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3906
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3907

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3885
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3914
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3917
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3918

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3921
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3922

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3925
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3926

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3929
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3930

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3933
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3934

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3912
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3943
    .return('I')
# }
.annotate 'line', 3944

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3939
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3953
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3954

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3957
    self.'optimizearg'()
.annotate 'line', 3958
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3959
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3960
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3961
    eq $I1, 0, __label_1
.annotate 'line', 3962
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3964
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3966
    .return(self)
# }
.annotate 'line', 3967

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
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
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3972
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
 __label_6:
.annotate 'line', 3973
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
 __label_7:
.annotate 'line', 3974
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3977
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
 __label_8:
.annotate 'line', 3978
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3979
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3980
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3981
    __ARG_1.'emitlabel'($S4)
# }
 __label_4: # endif
# }
.annotate 'line', 3983

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3949
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3992
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3993

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3996
    self.'optimizearg'()
.annotate 'line', 3997
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3998
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3999
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4000
    ne $I1, 0, __label_1
.annotate 'line', 4001
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 4003
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 4005
    .return(self)
# }
.annotate 'line', 4006

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4009
# res: $S1
    null $S1
.annotate 'line', 4010
    if_null __ARG_2, __label_0
.annotate 'line', 4011
    set $S1, __ARG_2
    goto __label_1
 __label_0: # else
.annotate 'line', 4013
    $P1 = self.'tempreg'('I')
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 4014
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 4015
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 4016
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
 __label_6:
.annotate 'line', 4017
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 4020
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
 __label_7:
.annotate 'line', 4021
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4022
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4023
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4024
    __ARG_1.'emitlabel'($S4)
# }
 __label_3: # endif
# }
.annotate 'line', 4026

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3988
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4031
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4041
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4042

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4045
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
.annotate 'line', 4046
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4047
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4048
    self.'annotate'(__ARG_1)
.annotate 'line', 4049
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4050

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4053
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4054

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4037
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4063
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4064

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4067
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
.annotate 'line', 4068
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4069
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4070
    self.'annotate'(__ARG_1)
.annotate 'line', 4071
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4072

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4075
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4076

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4059
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4085
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4086

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4089
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
.annotate 'line', 4090
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4091
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4092
    self.'annotate'(__ARG_1)
.annotate 'line', 4093
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4094

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4097
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4098

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4081
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4108
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4109
    isa $I1, __ARG_3, [ 'ConcatString' ]
    unless $I1 goto __label_0
# {
.annotate 'line', 4110
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4111
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_2
.annotate 'line', 4112
    getattribute $P1, self, 'values'
    getattribute $P2, __ARG_4, 'values'
    $P1.'append'($P2)
    goto __label_3
 __label_2: # else
.annotate 'line', 4114
    getattribute $P3, self, 'values'
# predefined push
    push $P3, __ARG_4
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 4116
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_4
# {
.annotate 'line', 4117
    getattribute $P2, __ARG_4, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4118
    getattribute $P1, self, 'values'
    $P1.'unshift'(__ARG_3)
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4121
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_3
    push $P2, __ARG_4
    setattribute self, 'values', $P2
 __label_5: # endif
 __label_1: # endif
# }
.annotate 'line', 4122

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4123
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4126
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4127
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4128
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4129
# i: $I2
    null $I2
# for loop
.annotate 'line', 4130
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4131
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
 __label_0: # for iteration
.annotate 'line', 4130
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4132
    .return($P2)
# }
.annotate 'line', 4133

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4136
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4137
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4138
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4139
    self.'annotate'(__ARG_1)
.annotate 'line', 4140
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4141
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4142
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_0: # for iteration
.annotate 'line', 4141
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4143
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4144

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4147
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4148
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4149
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4150
    self.'annotate'(__ARG_1)
.annotate 'line', 4151
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4152
# i: $I2
    set $I2, 2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4153
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_1: # for iteration
.annotate 'line', 4152
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4154
    .return($S1)
# }
.annotate 'line', 4155

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4158
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4159
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4160
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4161
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4162
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4161
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4163

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4166
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4167
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4168
    self.'annotate'(__ARG_1)
.annotate 'line', 4169
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4170
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4171
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4170
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4172

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4103
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4105
    addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4181
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4182

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4185
    self.'optimizearg'()
.annotate 'line', 4186
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4187
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4188
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
 __label_0:
.annotate 'line', 4189
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
 __label_1:
.annotate 'line', 4190
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
 __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4191
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
 __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4192
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4193
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4194
# var t: $P5
    null $P5
.annotate 'line', 4195
# es: $S3
    getattribute $P10, $P3, 'str'
    null $S3
    if_null $P10, __label_6
    set $S3, $P10
 __label_6:
.annotate 'line', 4196
# rs: $S4
    getattribute $P10, $P4, 'str'
    null $S4
    if_null $P10, __label_7
    set $S4, $P10
 __label_7:
.annotate 'line', 4197
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_10
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
 __label_10:
    unless $I3 goto __label_8
.annotate 'line', 4198
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_9
 __label_8: # else
.annotate 'line', 4200
    new $P13, [ 'TokenQuoted' ]
    getattribute $P14, $P3, 'file'
    getattribute $P15, $P3, 'line'
    concat $S6, $S3, $S4
    $P13.'TokenQuoted'($P14, $P15, $S6)
    set $P5, $P13
 __label_9: # endif
.annotate 'line', 4201
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
 __label_4: # endif
.annotate 'line', 4203
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_12
    iseq $I3, $S2, 'I'
 __label_12:
    unless $I3 goto __label_11
# {
.annotate 'line', 4204
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4205
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4206
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4207
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4208
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
 __label_11: # endif
# {
.annotate 'line', 4211
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_13
    unless $P10 goto __label_13
# {
.annotate 'line', 4212
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4213
# lf: $N1
# predefined string
    set $S5, $P8
    set $N1, $S5
.annotate 'line', 4214
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4215
# rf: $N2
# predefined string
    set $S5, $P9
    set $N2, $S5
.annotate 'line', 4216
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
 __label_13: # endif
# }
# }
 __label_2: # endif
.annotate 'line', 4220
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_15
    iseq $I3, $S2, 'S'
 __label_15:
    unless $I3 goto __label_14
# {
.annotate 'line', 4221
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
 __label_14: # endif
.annotate 'line', 4223
    .return(self)
# }
.annotate 'line', 4224

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4227
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4228
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4229
    ne $S1, $S2, __label_2
.annotate 'line', 4230
    .return($S1)
 __label_2: # endif
.annotate 'line', 4231
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4232
    .return('S')
 __label_3: # endif
.annotate 'line', 4233
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4234
    .return('S')
 __label_5: # endif
.annotate 'line', 4235
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4236
    .return('N')
 __label_7: # endif
.annotate 'line', 4237
    .return('I')
# }
.annotate 'line', 4238

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4241
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4242
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4243
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4244
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4245
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 4247
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 4248
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
 __label_4:
.annotate 'line', 4249
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4250
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
 __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4251
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
 __label_9:
.annotate 'line', 4252
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4253
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4254
    set $S4, $S6
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 4257
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4258
    set $S5, $S6
# }
 __label_11: # endif
# }
 __label_7: # endif
.annotate 'line', 4261
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4264
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
 __label_15:
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4265
# l: $S7
    null $S7
.annotate 'line', 4266
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4268
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4269
    __ARG_1.'emitset'($S7, $S4)
# }
 __label_17: # endif
.annotate 'line', 4271
# r: $S8
    null $S8
.annotate 'line', 4272
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
 __label_18: # else
# {
.annotate 'line', 4274
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4275
    __ARG_1.'emitset'($S8, $S5)
# }
 __label_19: # endif
.annotate 'line', 4277
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 4280
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
 __label_13: # endif
# }
 __label_6: # endif
# }
.annotate 'line', 4282

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4177
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4291
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4292

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4295
    self.'optimizearg'()
.annotate 'line', 4296
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4297
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4298
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4299
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4300
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4301
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4302
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4303
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4304
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4305
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4306
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 4309
    .return(self)
# }
.annotate 'line', 4310

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4313
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4314
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4315
    ne $S1, $S2, __label_2
.annotate 'line', 4316
    .return($S1)
 __label_2: # endif
.annotate 'line', 4317
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4318
    .return('N')
 __label_3: # endif
.annotate 'line', 4319
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4320
    .return('N')
 __label_5: # endif
.annotate 'line', 4321
    .return('I')
# }
.annotate 'line', 4322

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4325
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4326
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4327
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4328

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4287
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4337
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4338

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4341
    self.'optimizearg'()
.annotate 'line', 4342
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4343
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4344
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4345
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 4346
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
 __label_3:
.annotate 'line', 4347
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4348
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4349
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4350
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4351
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4352
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
 __label_4: # endif
# {
.annotate 'line', 4355
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4356
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4357
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4358
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4359
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4360
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
 __label_6: # endif
# }
# }
 __label_0: # endif
.annotate 'line', 4364
    .return(self)
# }
.annotate 'line', 4365

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4368
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4369
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4370
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4371
    ne $S1, $S2, __label_2
.annotate 'line', 4372
    .return($S1)
 __label_2: # endif
.annotate 'line', 4373
    ne $S1, 'S', __label_3
.annotate 'line', 4374
    .return('S')
    goto __label_4
 __label_3: # else
.annotate 'line', 4376
    .return('N')
 __label_4: # endif
# }
.annotate 'line', 4377

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4380
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4381
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4382
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4383
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4384
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4385
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4386
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4387
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4388
# rval: $S5
    null $S5
.annotate 'line', 4389
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 4391
    set $S5, $S4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 4394
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4395
    __ARG_1.'emitset'($S5, $S4)
 __label_3: # switch end
.annotate 'line', 4397
    self.'annotate'(__ARG_1)
.annotate 'line', 4398
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4399
    .return()
# }
 __label_2: # endif
.annotate 'line', 4401
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
.annotate 'line', 4402
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4403
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4404
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4405
    .return()
# }
 __label_6: # endif
.annotate 'line', 4410
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4411
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4412
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4413
# rval: $S6
    null $S6
.annotate 'line', 4414
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
# switch
 __label_13: # case
.annotate 'line', 4416
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4417
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4418
    set $S6, $S4
    goto __label_11 # break
 __label_14: # case
.annotate 'line', 4421
    set $S6, $S4
    goto __label_11 # break
 __label_12: # default
.annotate 'line', 4424
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4425
    __ARG_1.'emitset'($S6, $S4)
 __label_11: # switch end
.annotate 'line', 4427
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4428
    self.'annotate'(__ARG_1)
.annotate 'line', 4429
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
 __label_15: # endif
.annotate 'line', 4431
    .return()
# }
 __label_10: # endif
.annotate 'line', 4434
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4435
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
 __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4436
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4437
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4440
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4441
    set $S3, $I1
# }
 __label_17: # endif
.annotate 'line', 4443
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4444
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4445
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 4448
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
.annotate 'line', 4450
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4451
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
 __label_25: # case
.annotate 'line', 4454
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
 __label_26: # case
 __label_23: # default
.annotate 'line', 4458
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4459
    set $S4, $I2
    goto __label_22 # break
 __label_22: # switch end
.annotate 'line', 4460
# }
 __label_20: # endif
.annotate 'line', 4463
    self.'annotate'(__ARG_1)
.annotate 'line', 4464
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4465
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
 __label_27: # endif
.annotate 'line', 4466
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4467

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4333
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4476
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4477

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4480
    self.'optimizearg'()
.annotate 'line', 4481
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4482
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4483
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4484
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4485
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4486
# var lval: $P3
    null $P3
.annotate 'line', 4487
# var rval: $P4
    null $P4
.annotate 'line', 4488
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4489
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4490
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4491
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4492
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4493
    eq $I2, 0, __label_6
.annotate 'line', 4494
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
.annotate 'line', 4497
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4498
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4499
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4500
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4501
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4502
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4503
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
.annotate 'line', 4507
    .return(self)
# }
.annotate 'line', 4508

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4511
    .return('N')
# }
.annotate 'line', 4512

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4515
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4516
# var aux: $P2
    null $P2
.annotate 'line', 4517
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4518
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4519
    $P2 = self.'tempreg'('N')
.annotate 'line', 4520
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4521
    set $P3, $P2
# }
 __label_0: # endif
.annotate 'line', 4523
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4524
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4525
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4526
    $P2 = self.'tempreg'('N')
.annotate 'line', 4527
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4528
    set $P5, $P2
# }
 __label_1: # endif
.annotate 'line', 4530
    self.'annotate'(__ARG_1)
.annotate 'line', 4531
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4532

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4472
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4541
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4542

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4545
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4546
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4547
    self.'annotate'(__ARG_1)
.annotate 'line', 4548
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4549

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4552
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4553

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4537
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4562
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4563

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4566
    .return('I')
# }
.annotate 'line', 4567

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4570
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4571
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4572
    self.'annotate'(__ARG_1)
.annotate 'line', 4577
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4578

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4558
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4587
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4588

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4591
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
.annotate 'line', 4592
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4593
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4594
    self.'annotate'(__ARG_1)
.annotate 'line', 4595
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4596

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4599
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4600

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4583
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4609
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4610

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4613
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
.annotate 'line', 4614
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4615
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4616
    self.'annotate'(__ARG_1)
.annotate 'line', 4617
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4618

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4621
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4622

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4605
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4633
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4634
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4635

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4638
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4639
    .return(self)
# }
.annotate 'line', 4640

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4643
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4644

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4629
    addattribute $P0, 'arg'
.annotate 'line', 4630
    addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4656
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4657
    setattribute self, 'start', __ARG_2
.annotate 'line', 4658
# var args: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4659
# var t: $P2
    $P2 = __ARG_3.'get'()
.annotate 'line', 4660
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 4661
    __ARG_3.'unget'($P2)
 __label_1: # do
.annotate 'line', 4662
# {
.annotate 'line', 4663
# var modifier: $P3
    null $P3
.annotate 'line', 4664
# var expr: $P4
    $P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4665
    $P2 = __ARG_3.'get'()
.annotate 'line', 4666
    $P5 = $P2.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4667
    $P2 = __ARG_3.'get'()
.annotate 'line', 4668
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4669
    new $P6, [ 'ModifierList' ]
    $P6.'ModifierList'(__ARG_3, __ARG_1)
    set $P3, $P6
.annotate 'line', 4670
    $P2 = __ARG_3.'get'()
# }
    goto __label_6
 __label_5: # else
.annotate 'line', 4673
    'Expected'('modifier list', $P2)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 4675
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P4, $P3)
    set $P5, $P6
# predefined push
    push $P1, $P5
# }
 __label_3: # continue
.annotate 'line', 4676
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 4677
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_7
.annotate 'line', 4678
    'SyntaxError'("Unfinished argument list", $P2)
 __label_7: # endif
.annotate 'line', 4679
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_8
.annotate 'line', 4680
    setattribute self, 'args', $P1
 __label_8: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 4682

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4685
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4686
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
    .return($I1)
# }
.annotate 'line', 4687

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4690
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4691

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4694
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4695
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4696

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4699
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4700
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4701

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4704
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 4705
    .return(self)
# }
.annotate 'line', 4706

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4709
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4710
    unless_null $P1, __label_0
# {
.annotate 'line', 4711
    new $P2, ['ResizableStringArray']
.annotate 'line', 4712
# pnull: $S1
    set $S1, ''
.annotate 'line', 4713
    set $P1, $P2
.annotate 'line', 4714
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4715
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4716
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4717
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4718
# reg: $S2
    null $S2
.annotate 'line', 4719
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4721
    ne $S1, '', __label_6
# {
.annotate 'line', 4722
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4723
    __ARG_1.'emitnull'($S1)
# }
 __label_6: # endif
.annotate 'line', 4725
    set $S2, $S1
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4728
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
 __label_5: # endif
.annotate 'line', 4729
# predefined push
    push $P1, $S2
# }
 __label_1: # for iteration
.annotate 'line', 4716
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4731
    setattribute self, 'argregs', $P1
# }
 __label_0: # endif
.annotate 'line', 4733
    .return($P1)
# }
.annotate 'line', 4734

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4737
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4738
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4740
# sep: $S1
    set $S1, ''
.annotate 'line', 4741
# n: $I1
    $P6 = self.'numargs'()
    set $I1, $P6
# for loop
.annotate 'line', 4742
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4743
# a: $S2
    $S2 = $P2[$I2]
.annotate 'line', 4744
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 4745
# var modifiers: $P3
    $P6 = $P1[$I2]
    getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4746
    if_null $P3, __label_3
# {
.annotate 'line', 4747
# isflat: $I3
    null $I3
# isnamed: $I4
    null $I4
.annotate 'line', 4748
# setname: $S3
    set $S3, ''
.annotate 'line', 4749
    $P6 = $P3.'getlist'()
    iter $P7, $P6
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4750
# name: $S4
    $P8 = $P4.'getname'()
    null $S4
    if_null $P8, __label_6
    set $S4, $P8
 __label_6:
.annotate 'line', 4751
    ne $S4, 'flat', __label_7
.annotate 'line', 4752
    set $I3, 1
 __label_7: # endif
.annotate 'line', 4753
    ne $S4, 'named', __label_8
# {
.annotate 'line', 4754
    set $I4, 1
.annotate 'line', 4755
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
.annotate 'line', 4759
# var argmod: $P5
    $P5 = $P4.'getarg'(0)
.annotate 'line', 4760
    $P8 = $P5.'isstringliteral'()
    isfalse $I7, $P8
    unless $I7 goto __label_13
.annotate 'line', 4761
    getattribute $P9, self, 'start'
    'SyntaxError'('Invalid modifier', $P9)
 __label_13: # endif
.annotate 'line', 4762
    $P10 = $P5.'getPirString'()
    set $S3, $P10
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 4765
    getattribute $P11, self, 'start'
    'SyntaxError'('Invalid modifier', $P11)
 __label_9: # switch end
# }
 __label_8: # endif
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 4769
    unless $I3 goto __label_14
# {
.annotate 'line', 4770
    unless $I4 goto __label_16
.annotate 'line', 4771
    __ARG_1.'print'(' :flat :named')
    goto __label_17
 __label_16: # else
.annotate 'line', 4773
    __ARG_1.'print'(' :flat')
 __label_17: # endif
# }
    goto __label_15
 __label_14: # else
.annotate 'line', 4775
    unless $I4 goto __label_18
# {
.annotate 'line', 4776
    __ARG_1.'print'(' :named')
.annotate 'line', 4777
    eq $S3, '', __label_19
.annotate 'line', 4778
    __ARG_1.'print'("(", $S3, ")")
 __label_19: # endif
# }
 __label_18: # endif
 __label_15: # endif
# }
 __label_3: # endif
.annotate 'line', 4781
    set $S1, ', '
# }
 __label_0: # for iteration
.annotate 'line', 4742
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4783

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4649
    addattribute $P0, 'owner'
.annotate 'line', 4650
    addattribute $P0, 'start'
.annotate 'line', 4651
    addattribute $P0, 'args'
.annotate 'line', 4652
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4788
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4789
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4790
    .return(0)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4791
    .return(1)
# }
.annotate 'line', 4792

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4803
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4804
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4805
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4806

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4809
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4810

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4813
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4814
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4815
    new $P3, ['ResizableStringArray']
.annotate 'line', 4816
# var arg: $P4
    null $P4
.annotate 'line', 4817
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4818
# pnull: $S1
    set $S1, ''
.annotate 'line', 4819
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 4821
    iter $P7, $P2
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4822
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 4824
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4825
    ne $S1, '', __label_8
# {
.annotate 'line', 4826
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4827
    __ARG_1.'emitnull'($S1)
# }
 __label_8: # endif
.annotate 'line', 4829
    set $S2, $S1
# }
 __label_7: # endif
.annotate 'line', 4831
# predefined push
    push $P3, $S2
# }
    goto __label_4
 __label_5: # endfor
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 4835
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4836
    iter $P9, $P2
    set $P9, 0
 __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4837
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
 __label_10: # endfor
.annotate 'line', 4838
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4839
    .return()
 __label_1: # default
.annotate 'line', 4841
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4842
# i: $I3
    null $I3
 __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4843
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4844
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
 __label_14:
.annotate 'line', 4845
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
 __label_15:
.annotate 'line', 4846
# argr: $S5
    null $S5
.annotate 'line', 4847
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
.annotate 'line', 4848
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
.annotate 'line', 4852
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4853
    __ARG_1.'emitnull'($S5)
    goto __label_18 # break
 __label_19: # default
.annotate 'line', 4856
    ne $S1, '', __label_23
# {
.annotate 'line', 4857
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4858
    __ARG_1.'emitnull'($S1)
# }
 __label_23: # endif
.annotate 'line', 4860
    set $S5, $S1
 __label_18: # switch end
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4864
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
 __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4865
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 4867
# aux: $S6
    null $S6
.annotate 'line', 4868
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
.annotate 'line', 4869
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
.annotate 'line', 4871
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
.annotate 'line', 4875
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4876
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 4879
    $P4.'emit'(__ARG_1, $S5)
 __label_33: # switch end
    goto __label_27 # break
 __label_30: # case
 __label_31: # case
 __label_32: # case
.annotate 'line', 4885
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4886
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
 __label_28: # default
.annotate 'line', 4889
    $P4.'emit'(__ARG_1, $S5)
 __label_27: # switch end
# }
 __label_25: # endif
# }
 __label_17: # endif
.annotate 'line', 4893
# predefined push
    push $P3, $S5
# }
 __label_11: # for iteration
.annotate 'line', 4842
    inc $I3
    goto __label_13
 __label_12: # for end
 __label_0: # switch end
.annotate 'line', 4896
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4897

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4796
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4798
    addattribute $P0, 'predef'
.annotate 'line', 4799
    addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4909
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4910
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4911
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4912
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4913
    __ARG_1.'unget'($P1)
.annotate 'line', 4914
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 4916

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4917
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4920
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4921
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4922
# nargs: $I1
    null $I1
.annotate 'line', 4923
    if_null $P2, __label_0
# {
.annotate 'line', 4924
    $P2 = $P2.'optimize'()
.annotate 'line', 4925
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
 __label_0: # endif
.annotate 'line', 4928
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_1
.annotate 'line', 4929
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_1: # endif
.annotate 'line', 4930
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 4931
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_2: # endif
.annotate 'line', 4934
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4935
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 4936
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4937
    if_null $P3, __label_5
# {
.annotate 'line', 4938
    self.'use_predef'($S1)
.annotate 'line', 4939
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
 __label_7:
    $P4 = $P2.'getrawargs'()
 __label_6:
.annotate 'line', 4942
    isa $I2, $P3, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_8
# {
.annotate 'line', 4943
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4944
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4945
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
 __label_9: # endif
# }
 __label_8: # endif
.annotate 'line', 4949
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
.annotate 'line', 4953
    setattribute self, 'funref', $P1
.annotate 'line', 4954
    setattribute self, 'args', $P2
.annotate 'line', 4955
    .return(self)
# }
.annotate 'line', 4956

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 4959
    .return(1)
# }
.annotate 'line', 4960

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4963
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4964
# call: $S1
    null $S1
.annotate 'line', 4965
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4966
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 4967
    ne $S1, '', __label_2
.annotate 'line', 4968
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
.annotate 'line', 4971
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 4972
    .return($S1)
# }
.annotate 'line', 4973

.end # emitcall


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4976
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4977
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4978
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4979
    if_null $P2, __label_1
.annotate 'line', 4980
    $P2.'getargvalues'(__ARG_1)
 __label_1: # endif
.annotate 'line', 4982
    self.'annotate'(__ARG_1)
.annotate 'line', 4984
    __ARG_1.'print'('    ')
.annotate 'line', 4985
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 4986
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 4987
    __ARG_1.'print'('.tailcall ')
    goto __label_5
 __label_4: # else
.annotate 'line', 4989
    __ARG_1.'print'(__ARG_2, ' = ')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 4992
    __ARG_1.'print'($S1)
.annotate 'line', 4993
    __ARG_1.'print'('(')
.annotate 'line', 4994
    if_null $P2, __label_6
.annotate 'line', 4995
    $P2.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 4996
    __ARG_1.'say'(')')
# }
.annotate 'line', 4997

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4902
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4904
    addattribute $P0, 'funref'
.annotate 'line', 4905
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5009
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5010
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5011
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5012

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5015
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5016
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5017
    $P5 = $P1.'get_member'()
.annotate 'line', 5016
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 5018

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5005
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5028
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5029
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5030
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5031

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5034
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5035
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5036
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5037
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5038
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
 __label_0: # endif
.annotate 'line', 5041
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
 __label_2:
.annotate 'line', 5042
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
 __label_3:
.annotate 'line', 5043
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5044

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5024
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5054
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5055
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5056

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5059
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5060
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5061
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 5062
    eq $S1, 'P', __label_2
# {
.annotate 'line', 5063
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5064
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5065
    __ARG_1.'emitbox'($S2, $S3)
# }
 __label_2: # endif
.annotate 'line', 5067
    .return($S2)
# }
.annotate 'line', 5068

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5049
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5051
    addattribute $P0, 'left'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5077
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5078
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5079

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5080
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5083
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5084
    .return(self)
# }
.annotate 'line', 5085

.end # optimize


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5088
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5089

.end # get_member


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5092
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5093
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5094
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5095
    self.'annotate'(__ARG_1)
.annotate 'line', 5096
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 5097
    .return($S3)
# }
.annotate 'line', 5098

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5101
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5102
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5103
    self.'annotate'(__ARG_1)
.annotate 'line', 5104
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5105

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5108
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5109

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5112
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5113
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5114
# value: $S3
    null $S3
.annotate 'line', 5115
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5117
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5118
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5119
    __ARG_1.'emitnull'(__ARG_3)
# }
 __label_4: # endif
.annotate 'line', 5121
    set $S3, __ARG_3
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 5124
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 5125
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
 __label_3: # endif
.annotate 'line', 5127
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 5128

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5131
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5132
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5133
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5134
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5135
    __ARG_1.'emitnull'($S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 5137
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
 __label_5:
.annotate 'line', 5138
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 5139
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
 __label_6: # else
.annotate 'line', 5141
    set $S3, $S4
 __label_7: # endif
# }
 __label_4: # endif
.annotate 'line', 5143
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 5144
    .return($S3)
# }
.annotate 'line', 5145

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5071
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5073
    addattribute $P0, 'right'
.end
.namespace [ 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5155
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5156
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5157

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5158
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5161
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5162
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5163
    .return(self)
# }
.annotate 'line', 5164

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5168
    getattribute $P1, self, 'start'
.annotate 'line', 5167
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 5169

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5150
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5152
    addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5182
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5183
    setattribute self, 'left', __ARG_4
.annotate 'line', 5184
    self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5185

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5188
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5189
    .return('S')
    goto __label_1
 __label_0: # else
.annotate 'line', 5191
    .return('P')
 __label_1: # endif
# }
.annotate 'line', 5192

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5195
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 5196
    setattribute self, 'left', $P1
.annotate 'line', 5197
    self.'optimizeargs'()
.annotate 'line', 5201
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P4 = self.'numargs'()
    set $I3, $P4
    iseq $I2, $I3, 1
 __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5202
# var arg: $P2
    $P2 = self.'getarg'(0)
.annotate 'line', 5203
    $P4 = $P2.'isintegerliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 5204
# ival: $I1
    $P5 = $P2.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5205
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 5206
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, self, 'start'
    getattribute $P5, $P4, 'file'
    getattribute $P6, self, 'start'
    getattribute $P7, $P6, 'line'
.annotate 'line', 5207
# predefined substr
    substr $S2, $S1, $I1, 1
    $P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5208
    new $P5, [ 'StringLiteral' ]
    getattribute $P6, self, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5211
    .return(self)
# }
.annotate 'line', 5212

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5215
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5216
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5217
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5218
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
 __label_0: # endif
.annotate 'line', 5219
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5220
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
 __label_2: # else
.annotate 'line', 5222
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
 __label_3: # endif
.annotate 'line', 5223
    setattribute self, 'regleft', $P1
.annotate 'line', 5224
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5225
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5226

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5229
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5230
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5231
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5232
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
 __label_0: # endif
.annotate 'line', 5233
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5234
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5235
    __ARG_1.'print'(']')
# }
.annotate 'line', 5236

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5239
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5240
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5241
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5242
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5243
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5244
    eq $I1, 1, __label_3
.annotate 'line', 5245
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
 __label_3: # endif
.annotate 'line', 5246
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5247
    __ARG_2 = self.'tempreg'('S')
 __label_4: # endif
.annotate 'line', 5248
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 5251
    self.'annotate'(__ARG_1)
.annotate 'line', 5252
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5253
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5254
    __ARG_1.'say'('')
# }
 __label_2: # endif
# }
.annotate 'line', 5256

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5259
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5260
    self.'annotate'(__ARG_1)
.annotate 'line', 5261
    __ARG_1.'print'('    ')
.annotate 'line', 5262
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5263
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5264

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5267
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5268
# rreg: $S1
    null $S1
.annotate 'line', 5269
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5270
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5271
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5274
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5275
    self.'annotate'(__ARG_1)
.annotate 'line', 5276
    __ARG_1.'print'('    ')
.annotate 'line', 5277
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5278
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5279
    .return($S1)
# }
.annotate 'line', 5280

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5174
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'SimpleArgList' ]
    addparent $P0, $P2
.annotate 'line', 5176
    addattribute $P0, 'left'
.annotate 'line', 5177
    addattribute $P0, 'regleft'
.annotate 'line', 5178
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5291
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5292
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
.annotate 'line', 5293
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5294
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 5295
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5296
# {
.annotate 'line', 5297
# var item: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5298
    getattribute $P3, self, 'values'
# predefined push
    push $P3, $P2
# }
 __label_3: # continue
.annotate 'line', 5299
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 5300
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 5301
    'Expected'("']' or ','", $P1)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 5303

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5304
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5307
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5308
    .return(self)
# }
.annotate 'line', 5309

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5312
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5313
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 5314
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5320
    self.'emit_init'(__ARG_1, '')
# }
 __label_1: # endif
# }
.annotate 'line', 5322

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5325
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5326
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5327
    .return($S1)
# }
.annotate 'line', 5328

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5331
    self.'annotate'(__ARG_1)
.annotate 'line', 5332
# itemreg: $S1
    null $S1
.annotate 'line', 5333
# it_p: $S2
    null $S2
.annotate 'line', 5334
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5335
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5336
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
 __label_0: # endif
.annotate 'line', 5338
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5339
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
 __label_3:
.annotate 'line', 5340
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
.annotate 'line', 5342
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 5343
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5344
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5345
    set $S1, $S2
# }
 __label_10: # endif
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 5349
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5350
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5351
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5352
    __ARG_1.'emitnull'($S1)
# }
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
.annotate 'line', 5356
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_12: # endif
 __label_4: # switch end
.annotate 'line', 5358
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5359
    self.'annotate'(__ARG_1)
.annotate 'line', 5360
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
 __label_14: # endif
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 5363

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5285
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5287
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5375
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5376
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5377
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5378
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5379
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5380
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5381
# {
.annotate 'line', 5382
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5383
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5384
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5385
# predefined push
    push $P2, $P4
.annotate 'line', 5386
# predefined push
    push $P3, $P5
# }
 __label_3: # continue
.annotate 'line', 5388
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
 __label_2: # enddo
.annotate 'line', 5389
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5390
    'Expected'("',' or '}'", $P1)
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 5392
    setattribute self, 'keys', $P2
.annotate 'line', 5393
    setattribute self, 'values', $P3
# }
.annotate 'line', 5394

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5395
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5398
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5399
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5400
    .return(self)
# }
.annotate 'line', 5401

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5404
    self.'annotate'(__ARG_1)
.annotate 'line', 5409
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5410
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
 __label_0: # endif
.annotate 'line', 5412
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5413
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5414
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5415
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5416
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5417
# item: $S1
    null $S1
.annotate 'line', 5418
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5419
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5420
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5421
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5424
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
 __label_5: # endif
.annotate 'line', 5426
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5427
# itemreg: $S3
    null $S3
.annotate 'line', 5428
    $P5 = $P4.'isnull'()
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 5429
    set $S6, __ARG_2
    eq $S6, '', __label_9
# {
.annotate 'line', 5430
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5431
    __ARG_1.'emitnull'($S3)
# }
 __label_9: # endif
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5434
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5435
# s: $S4
    $P6 = $P4.'checkIdentifier'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 5436
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
 __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5437
    set $S3, $S4
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 5439
# id: $S5
    $P5 = $P4.'getName'()
    null $S5
    if_null $P5, __label_16
    set $S5, $P5
 __label_16:
.annotate 'line', 5440
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5441
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5442
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
 __label_17: # else
.annotate 'line', 5445
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_18: # endif
# }
 __label_14: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 5449
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_11: # endif
 __label_8: # endif
.annotate 'line', 5450
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5451
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
 __label_19: # endif
# }
 __label_1: # for iteration
.annotate 'line', 5415
    inc $I2
    goto __label_3
 __label_2: # for end
# }
.annotate 'line', 5453

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5456
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5457
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5458
    .return($S1)
# }
.annotate 'line', 5459

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5368
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5370
    addattribute $P0, 'keys'
.annotate 'line', 5371
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5468
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5473
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 5474
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5475
    $P5 = $P2.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 5476
    __ARG_1.'unget'($P2)
.annotate 'line', 5477
# var initializer: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
 __label_1: # do
.annotate 'line', 5478
# {
.annotate 'line', 5479
# var auxinit: $P4
    $P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5480
# predefined push
    push $P3, $P4
# }
 __label_3: # continue
.annotate 'line', 5481
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 5482
    setattribute self, 'initializer', $P3
.annotate 'line', 5483
    'RequireOp'(')', $P2)
# }
 __label_0: # endif
# }
.annotate 'line', 5485

.end # parseinitializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5488
    getattribute $P1, self, 'initializer'
    'optimize_array'($P1)
.annotate 'line', 5489
    .return(self)
# }
.annotate 'line', 5490

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5464
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5466
    addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5501
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5503
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
 __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5504
    'SyntaxError'("Unimplemented", __ARG_4)
 __label_0: # endif
.annotate 'line', 5505
    setattribute self, 'value', __ARG_4
.annotate 'line', 5506
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5508
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5509
    self.'parseinitializer'(__ARG_1)
    goto __label_3
 __label_2: # else
.annotate 'line', 5511
    __ARG_1.'unget'($P1)
 __label_3: # endif
# }
.annotate 'line', 5512

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5515
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5516
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5519
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5520
# var desc: $P3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'getvar'($P2)
.annotate 'line', 5521
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5522
    $P4 = $P3.'getid'()
    unless_null $P4, __label_4
# {
.annotate 'line', 5523
    $P1 = $P3.'getvalue'()
.annotate 'line', 5524
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5525
    'SyntaxError'('Constant value must evaluate to a string', $P1)
 __label_6: # endif
.annotate 'line', 5526
    getattribute $P5, $P1, 'strval'
    setattribute self, 'value', $P5
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5529
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
 __label_5: # endif
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5533
    getattribute $P4, self, 'initializer'
    'optimize_array'($P4)
.annotate 'line', 5534
    .return(self)
# }
.annotate 'line', 5535

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5538
    self.'annotate'(__ARG_1)
.annotate 'line', 5540
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5541
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
.annotate 'line', 5544
# type: $I2
    getattribute $P9, self, 'value'
    $P8 = $P9.'isstring'()
    if_null $P8, __label_3
    unless $P8 goto __label_3
    null $I2
    goto __label_2
 __label_3:
.annotate 'line', 5545
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
.annotate 'line', 5547
# reginit: $S1
    set $S1, ''
.annotate 'line', 5548
# regnew: $S2
    set $P8, __ARG_2
    null $S2
    if_null $P8, __label_6
    set $S2, $P8
 __label_6:
.annotate 'line', 5549
# constructor: $S3
    null $S3
.annotate 'line', 5550
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
.annotate 'line', 5554
    ne $I2, 1, __label_11
# {
.annotate 'line', 5555
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 5556
    $P8 = self.'tempreg'('P')
    set $S2, $P8
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
# {
.annotate 'line', 5559
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5560
    $P8 = $P2.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 5561
    concat $S0, ', ', $S1
    set $S1, $S0
# }
 __label_12: # endif
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 5565
    eq $I2, 1, __label_14
.annotate 'line', 5566
    getattribute $P8, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P8)
 __label_14: # endif
.annotate 'line', 5567
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 5568
    $P9 = self.'tempreg'('P')
    set $S2, $P9
 __label_15: # endif
 __label_7: # switch end
.annotate 'line', 5571
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_18
    set $I4, 1
    if $I3 == $I4 goto __label_19
    goto __label_17
# switch
 __label_18: # case
.annotate 'line', 5574
# name: $S4
    getattribute $P9, self, 'value'
    $P8 = $P9.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
 __label_20:
.annotate 'line', 5575
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5576
    isnull $I5, $P3
    unless $I5 goto __label_22
    $I5 = self.'dowarnings'()
 __label_22:
    unless $I5 goto __label_21
.annotate 'line', 5577
    concat $S6, "Can't locate class ", $S4
    concat $S6, $S6, " at compile time"
    getattribute $P10, self, 'value'
    'Warn'($S6, $P10)
 __label_21: # endif
.annotate 'line', 5581
    getattribute $P11, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P11, " ]", $S1)
.annotate 'line', 5582
    le $I1, 1, __label_23
# {
.annotate 'line', 5583
    getattribute $P12, self, 'value'
    __ARG_1.'say'($S2, ".'", $P12, "'()")
# }
 __label_23: # endif
    goto __label_16 # break
 __label_19: # case
.annotate 'line', 5587
# var id: $P4
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P4 = $P8.'getvar'($P9)
.annotate 'line', 5588
    unless_null $P4, __label_24
# {
.annotate 'line', 5590
# var cl: $P5
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'value'
    $P5 = $P10.'checkclass'($P11)
.annotate 'line', 5591
    if_null $P5, __label_26
# {
.annotate 'line', 5592
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
# }
    goto __label_27
 __label_26: # else
# {
.annotate 'line', 5595
    $P8 = self.'dowarnings'()
    if_null $P8, __label_28
    unless $P8 goto __label_28
.annotate 'line', 5596
    'Warn'('Checking: new unknown type')
 __label_28: # endif
.annotate 'line', 5597
    getattribute $P8, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P8, "']", $S1)
# }
 __label_27: # endif
.annotate 'line', 5599
    getattribute $P8, self, 'value'
    set $S3, $P8
# }
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 5603
    $P8 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
# }
 __label_25: # endif
    goto __label_16 # break
 __label_17: # default
.annotate 'line', 5607
    'InternalError'('Unexpected type in new')
 __label_16: # switch end
.annotate 'line', 5609
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isgt $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
 __label_31:
 __label_30:
    unless $I3 goto __label_29
# {
.annotate 'line', 5610
    new $P6, ['ResizableStringArray']
.annotate 'line', 5611
    iter $P13, $P1
    set $P13, 0
 __label_32: # for iteration
    unless $P13 goto __label_33
    shift $P7, $P13
# {
.annotate 'line', 5612
# reg: $S5
    $P8 = $P7.'emit_get'(__ARG_1)
    null $S5
    if_null $P8, __label_34
    set $S5, $P8
 __label_34:
.annotate 'line', 5613
# predefined push
    push $P6, $S5
# }
    goto __label_32
 __label_33: # endfor
.annotate 'line', 5615
    __ARG_1.'print'('    ', $S2, ".'", $S3, "'(")
.annotate 'line', 5616
# predefined join
    join $S6, ", ", $P6
    __ARG_1.'print'($S6)
.annotate 'line', 5617
    __ARG_1.'say'(")")
.annotate 'line', 5618
    not $I3, __ARG_3
    unless $I3 goto __label_35
.annotate 'line', 5619
    __ARG_1.'emitset'(__ARG_2, $S2)
 __label_35: # endif
# }
 __label_29: # endif
# }
.annotate 'line', 5621

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5624
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5625

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5495
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5497
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5636
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5637
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5638
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5639
    setattribute self, 'nskey', $P1
.annotate 'line', 5640
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5641
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5642
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5644
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5645

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5648
# reginit: $S1
    null $S1
.annotate 'line', 5649
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5650
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5651
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
.annotate 'line', 5655
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5656
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5659
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
 __label_2: # switch end
.annotate 'line', 5661
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5662
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5663
    __ARG_1.'print'("root_")
 __label_6: # endif
.annotate 'line', 5664
    __ARG_1.'print'('    ', 'new ', __ARG_2, ", ")
.annotate 'line', 5665
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5666
    if_null $S1, __label_7
.annotate 'line', 5667
    __ARG_1.'print'(', ', $S1)
 __label_7: # endif
.annotate 'line', 5668
    __ARG_1.'say'()
# }
.annotate 'line', 5669

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5630
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5632
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5680
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5681
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5682
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5683
    setattribute self, 'nskey', $P1
.annotate 'line', 5684
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5685
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5686
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5688
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5689

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5692
# reginit: $S1
    null $S1
.annotate 'line', 5693
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5695
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5696
# regnew: $S2
    set $P5, __ARG_2
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
 __label_2:
.annotate 'line', 5697
    le $I1, 0, __label_3
.annotate 'line', 5698
    $P5 = self.'tempreg'('P')
    set $S2, $P5
 __label_3: # endif
.annotate 'line', 5699
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5700
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5701
    getattribute $P5, self, 'owner'
    $P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5702
    __ARG_1.'say'()
.annotate 'line', 5704
    le $I1, 0, __label_4
# {
.annotate 'line', 5705
    new $P3, ['ResizableStringArray']
.annotate 'line', 5706
    iter $P6, $P1
    set $P6, 0
 __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P4, $P6
# {
.annotate 'line', 5707
# reg: $S3
    $P5 = $P4.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
 __label_7:
.annotate 'line', 5708
# predefined push
    push $P3, $S3
# }
    goto __label_5
 __label_6: # endfor
.annotate 'line', 5710
# constructor: $S4
    $P5 = $P2.'last'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
 __label_8:
.annotate 'line', 5711
    __ARG_1.'print'('    ', $S2, ".'", $S4, "'(")
.annotate 'line', 5712
# predefined join
    join $S5, ", ", $P3
    __ARG_1.'print'($S5)
.annotate 'line', 5713
    __ARG_1.'say'(")")
.annotate 'line', 5714
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
 __label_4: # endif
# }
.annotate 'line', 5716

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5674
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5676
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5723
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5725
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 5727
    new $P5, [ 'CallExpr' ]
.annotate 'line', 5728
    new $P7, [ 'StringLiteral' ]
    $P7.'StringLiteral'(__ARG_2, __ARG_3)
    set $P6, $P7
    $P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
    set $P4, $P5
.annotate 'line', 5727
    .return($P4)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5730
    $P3 = $P1.'isop'('[')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 5732
    new $P5, [ 'NewIndexedExpr' ]
    $P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 5734
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 5737
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5738
    __ARG_1.'unget'($P2)
.annotate 'line', 5739
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 5741
    new $P5, [ 'NewQualifiedExpr' ]
    $P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 5745
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
.annotate 'line', 5750
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_5: # endif
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5752

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5763
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5764
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5765
    $P2 = 'parseClassSpecifier'(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5766

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5769
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5770
    .return(self)
# }
.annotate 'line', 5771

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5772
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5775
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5777
# r: $S1
    null $S1
.annotate 'line', 5778
    set $S3, __ARG_2
    ne $S3, '', __label_0
.annotate 'line', 5779
    $P2 = self.'tempreg'('I')
    set $S1, $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 5781
    set $S1, __ARG_2
 __label_1: # endif
.annotate 'line', 5782
# check: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 5783
    self.'annotate'(__ARG_1)
.annotate 'line', 5784
    __ARG_1.'print'('    isa ', $S1, ', ', $S2, ', ')
.annotate 'line', 5785
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 5786
    __ARG_1.'say'()
# }
.annotate 'line', 5787

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5756
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5758
    addattribute $P0, 'lexpr'
.annotate 'line', 5759
    addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 5804
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5805
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5806
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5807
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5808
    .return(self)
# }
.annotate 'line', 5809

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5812
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 5813
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
.annotate 'line', 5815
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
 __label_3: # case
.annotate 'line', 5817
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
 __label_1: # default
.annotate 'line', 5819
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5820
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5821
    .return(self)
 __label_0: # switch end
# }
.annotate 'line', 5823

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5826
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5827

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5830
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5831
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5832
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5833
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5834
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5835
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5836
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5837
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5838

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5792
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5798
    addattribute $P0, 'condition'
.annotate 'line', 5799
    addattribute $P0, 'etrue'
.annotate 'line', 5800
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
# Body
# {
.annotate 'line', 5882
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
.annotate 'line', 5883
    .return(1)
 __label_3: # case
.annotate 'line', 5884
    .return(2)
 __label_4: # case
.annotate 'line', 5885
    .return(3)
 __label_1: # default
.annotate 'line', 5886
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5888

.end # getOpCode_2


.sub 'getOpCode_4'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5892
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
.annotate 'line', 5893
    .return(8)
 __label_3: # case
.annotate 'line', 5894
    .return(11)
 __label_4: # case
.annotate 'line', 5895
    .return(9)
 __label_5: # case
.annotate 'line', 5896
    .return(10)
 __label_1: # default
.annotate 'line', 5898
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
 __label_6: # else
.annotate 'line', 5899
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
 __label_8: # else
.annotate 'line', 5900
    .return(0)
 __label_9: # endif
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5902

.end # getOpCode_4


.sub 'getOpCode_5'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5906
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
.annotate 'line', 5907
    .return(19)
 __label_3: # case
.annotate 'line', 5908
    .return(20)
 __label_4: # case
.annotate 'line', 5909
    .return(21)
 __label_5: # case
.annotate 'line', 5910
    .return(22)
 __label_1: # default
.annotate 'line', 5911
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5913

.end # getOpCode_5


.sub 'getOpCode_7'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5917
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5918
    .return(28)
 __label_3: # case
.annotate 'line', 5919
    .return(29)
 __label_1: # default
.annotate 'line', 5920
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5922

.end # getOpCode_7


.sub 'getOpCode_8'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5926
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
.annotate 'line', 5927
    .return(14)
 __label_3: # case
.annotate 'line', 5928
    .return(16)
 __label_4: # case
.annotate 'line', 5929
    .return(15)
 __label_5: # case
.annotate 'line', 5930
    .return(17)
 __label_1: # default
.annotate 'line', 5932
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
 __label_6: # else
.annotate 'line', 5933
    .return(0)
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5935

.end # getOpCode_8


.sub 'getOpCode_9'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5939
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
.annotate 'line', 5940
    .return(12)
 __label_3: # case
.annotate 'line', 5941
    .return(13)
 __label_4: # case
.annotate 'line', 5942
    .return(25)
 __label_5: # case
.annotate 'line', 5943
    .return(26)
 __label_1: # default
.annotate 'line', 5944
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5946

.end # getOpCode_9


.sub 'getOpCode_16'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5950
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
.annotate 'line', 5951
    .return(4)
 __label_3: # case
.annotate 'line', 5952
    .return(5)
 __label_4: # case
.annotate 'line', 5953
    .return(6)
 __label_5: # case
.annotate 'line', 5954
    .return(18)
 __label_6: # case
.annotate 'line', 5955
    .return(23)
 __label_7: # case
.annotate 'line', 5956
    .return(24)
 __label_8: # case
.annotate 'line', 5957
    .return(30)
 __label_1: # default
.annotate 'line', 5958
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5960

.end # getOpCode_16


.sub 'parseExpr_0'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5964
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5966
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5967
# var expr: $P2
    null $P2
.annotate 'line', 5968
    $P4 = $P1.'isop'('(')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 5969
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5970
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 5971
    .return($P2)
# }
 __label_0: # endif
.annotate 'line', 5973
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5974
    new $P6, [ 'ArrayExpr' ]
    $P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 5975
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5976
    new $P6, [ 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 5977
    $P4 = $P1.'isstring'()
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 5978
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_3: # endif
.annotate 'line', 5979
    $P4 = $P1.'isint'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5980
    new $P6, [ 'IntegerLiteral' ]
    $P6.'IntegerLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_4: # endif
.annotate 'line', 5981
    $P4 = $P1.'isfloat'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 5982
    new $P6, [ 'FloatLiteral' ]
    $P6.'FloatLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_5: # endif
.annotate 'line', 5983
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
.annotate 'line', 5985
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
 __label_9: # case
.annotate 'line', 5987
    new $P6, [ 'FunctionExpr' ]
    $P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_10: # case
.annotate 'line', 5989
    new $P8, [ 'OpClassExpr' ]
    $P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P7, $P8
    .return($P7)
 __label_7: # default
 __label_6: # switch end
.annotate 'line', 5991
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_11
    unless $P4 goto __label_11
.annotate 'line', 5992
    new $P6, [ 'IdentifierExpr' ]
    $P6.'IdentifierExpr'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_11: # endif
.annotate 'line', 5993
    'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5994

.end # parseExpr_0


.sub 'parseExpr_2'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5998
.const 'Sub' $P5 = 'parseExpr_0'
.annotate 'line', 5999
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6001
# var subexp: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6002
# var t: $P2
    null $P2
.annotate 'line', 6003
# var start: $P3
    null $P3
.annotate 'line', 6004
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6005
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 6006
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
.annotate 'line', 6008
    new $P8, [ 'CallExpr' ]
    $P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P8
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6011
    new $P9, [ 'IndexExpr' ]
    $P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P9
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6014
    set $P3, $P2
.annotate 'line', 6015
    $P2 = __ARG_1.'get'()
.annotate 'line', 6016
    $P10 = $P2.'isop'('*')
    if_null $P10, __label_7
    unless $P10 goto __label_7
# {
.annotate 'line', 6017
# var right: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6018
    new $P7, [ 'MemberRefExpr' ]
    $P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P7
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 6021
    new $P7, [ 'MemberExpr' ]
    $P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
 __label_8: # endif
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6024
    'InternalError'('Unexpected code in parseExpr_2')
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6027
    __ARG_1.'unget'($P2)
.annotate 'line', 6028
    .return($P1)
# }
.annotate 'line', 6029

.end # parseExpr_2


.sub 'parseExpr_3'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6033
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6035
# var subexp: $P1
    $P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6036
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6037
    $P4 = $P2.'isop'('++')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 6038
    new $P6, [ 'OpPostIncExpr' ]
    $P6.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
.annotate 'line', 6039
    $P7 = $P2.'isop'('--')
    if_null $P7, __label_2
    unless $P7 goto __label_2
.annotate 'line', 6040
    new $P9, [ 'OpPostDecExpr' ]
    $P9.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P8, $P9
    .return($P8)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 6043
    __ARG_1.'unget'($P2)
.annotate 'line', 6044
    .return($P1)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 6046

.end # parseExpr_3


.sub 'parseExpr_4'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6050
.const 'Sub' $P3 = 'parseExpr_4'
.annotate 'line', 6051
.const 'Sub' $P4 = 'parseExpr_3'
.annotate 'line', 6052
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6054
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6055
# code: $I1
    $P6 = $P5($P1)
    set $I1, $P6
.annotate 'line', 6056
    eq $I1, 0, __label_0
# {
.annotate 'line', 6057
# var subexpr: $P2
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6058
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
.annotate 'line', 6060
    new $P7, [ 'OpUnaryMinusExpr' ]
    $P7.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_5: # case
.annotate 'line', 6062
    new $P9, [ 'OpNotExpr' ]
    $P9.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P8, $P9
    .return($P8)
 __label_6: # case
.annotate 'line', 6064
    new $P11, [ 'OpPreIncExpr' ]
    $P11.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
 __label_7: # case
.annotate 'line', 6066
    new $P13, [ 'OpPreDecExpr' ]
    $P13.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
 __label_8: # case
.annotate 'line', 6068
    new $P15, [ 'OpDeleteExpr' ]
    $P15.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
 __label_9: # case
.annotate 'line', 6070
    new $P17, [ 'OpExistsExpr' ]
    $P17.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
 __label_3: # default
.annotate 'line', 6072
    'InternalError'('Invalid code in parseExpr_4', $P1)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6076
    __ARG_1.'unget'($P1)
.annotate 'line', 6077
    .tailcall $P4(__ARG_1, __ARG_2)
# }
 __label_1: # endif
# }
.annotate 'line', 6079

.end # parseExpr_4


.sub 'parseExpr_5'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6083
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 6084
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6086
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6087
# var t: $P2
    null $P2
.annotate 'line', 6088
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6089
    $P2 = __ARG_1.'get'()
    $P6 = $P5($P2)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6090
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6091
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
.annotate 'line', 6093
    new $P6, [ 'OpMulExpr' ]
    $P6.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6096
    new $P7, [ 'OpDivExpr' ]
    $P7.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6099
    new $P8, [ 'OpModExpr' ]
    $P8.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P8
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6102
    new $P9, [ 'OpCModExpr' ]
    $P9.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P9
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6105
    'InternalError'('Invalid code in parseExpr_5', $P2)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6108
    __ARG_1.'unget'($P2)
.annotate 'line', 6109
    .return($P1)
# }
.annotate 'line', 6110

.end # parseExpr_5


.sub 'parseExpr_6'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6114
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6116
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6117
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6118
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6119
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6120
# var expr: $P4
    null $P4
.annotate 'line', 6121
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6122
    new $P7, [ 'OpAddExpr' ]
    $P7.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
    goto __label_4
 __label_3: # else
.annotate 'line', 6124
    new $P8, [ 'OpSubExpr' ]
    $P8.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P8
 __label_4: # endif
.annotate 'line', 6125
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6127
    __ARG_1.'unget'($P2)
.annotate 'line', 6128
    .return($P1)
# }
.annotate 'line', 6129

.end # parseExpr_6


.sub 'parseExpr_7'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6133
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6135
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6136
# var rexpr: $P2
    null $P2
.annotate 'line', 6137
# var t: $P3
    null $P3
.annotate 'line', 6138
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6139
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
.annotate 'line', 6140
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6142
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6143
    new $P6, [ 'OpShiftleftExpr' ]
    $P6.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6146
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6147
    new $P7, [ 'OpShiftrightExpr' ]
    $P7.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6150
    'InternalError'('Invalid code in parseExpr_7', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6153
    __ARG_1.'unget'($P3)
.annotate 'line', 6154
    .return($P1)
# }
.annotate 'line', 6155

.end # parseExpr_7


.sub 'parseExpr_8'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6159
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 6160
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6162
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6163
# var rexpr: $P2
    null $P2
.annotate 'line', 6164
# var t: $P3
    null $P3
.annotate 'line', 6165
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6166
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6167
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
.annotate 'line', 6169
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6170
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6173
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6174
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6177
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6178
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6181
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6182
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6185
    new $P11, [ 'OpInstanceOfExpr' ]
    $P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6188
    'InternalError'('Invalid code in parseExpr_9', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6191
    __ARG_1.'unget'($P3)
.annotate 'line', 6192
    .return($P1)
# }
.annotate 'line', 6193

.end # parseExpr_8


.sub 'parseExpr_9'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6197
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 6198
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6200
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6201
# var rexpr: $P2
    null $P2
.annotate 'line', 6202
# var t: $P3
    null $P3
.annotate 'line', 6203
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6204
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6205
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
.annotate 'line', 6207
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6208
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6211
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6212
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6215
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6216
    new $P9, [ 'OpSameExpr' ]
    $P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6219
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6220
    new $P10, [ 'OpSameExpr' ]
    $P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6223
    'InternalError'('Invalid code in parseExpr_8', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6226
    __ARG_1.'unget'($P3)
.annotate 'line', 6227
    .return($P1)
# }
.annotate 'line', 6228

.end # parseExpr_9


.sub 'parseExpr_10'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6232
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6234
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6235
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6236
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6237
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6238
    new $P5, [ 'OpBinAndExpr' ]
    $P5.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6240
    __ARG_1.'unget'($P2)
.annotate 'line', 6241
    .return($P1)
# }
.annotate 'line', 6242

.end # parseExpr_10


.sub 'parseExpr_11'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6246
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6248
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6249
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6250
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6251
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6252
    new $P5, [ 'OpBinXorExpr' ]
    $P5.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6254
    __ARG_1.'unget'($P2)
.annotate 'line', 6255
    .return($P1)
# }
.annotate 'line', 6256

.end # parseExpr_11


.sub 'parseExpr_12'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6260
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6262
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6263
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6264
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6265
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6266
    new $P5, [ 'OpBinOrExpr' ]
    $P5.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6268
    __ARG_1.'unget'($P2)
.annotate 'line', 6269
    .return($P1)
# }
.annotate 'line', 6270

.end # parseExpr_12


.sub 'parseExpr_13'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6274
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6276
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6277
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6278
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6279
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6280
    new $P5, [ 'OpBoolAndExpr' ]
    $P5.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6282
    __ARG_1.'unget'($P2)
.annotate 'line', 6283
    .return($P1)
# }
.annotate 'line', 6284

.end # parseExpr_13


.sub 'parseExpr_14'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6288
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6290
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6291
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6292
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6293
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6294
    new $P5, [ 'OpBoolOrExpr' ]
    $P5.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6296
    __ARG_1.'unget'($P2)
.annotate 'line', 6297
    .return($P1)
# }
.annotate 'line', 6298

.end # parseExpr_14


.sub 'parseExpr_15'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6302
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6303
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6305
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6306
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6307
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6308
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6309
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6310
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6311
    new $P8, [ 'OpConditionalExpr' ]
    $P8.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P7, $P8
    .return($P7)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6314
    __ARG_1.'unget'($P2)
.annotate 'line', 6315
    .return($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6317

.end # parseExpr_15


.sub 'parseExpr_16'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6321
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6322
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 6323
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6325
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6326
# var t: $P2
    null $P2
.annotate 'line', 6327
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6328
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6329
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6330
# var expr: $P4
    null $P4
.annotate 'line', 6331
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
.annotate 'line', 6333
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6336
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6339
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6342
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6345
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 6348
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
 __label_10: # case
.annotate 'line', 6351
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6354
    'InternalError'('Unexpected code in parseExpr_16', $P2)
 __label_2: # switch end
.annotate 'line', 6356
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6357
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6359
    __ARG_1.'unget'($P2)
.annotate 'line', 6360
    .return($P1)
# }
.annotate 'line', 6361

.end # parseExpr_16


.sub 'parseExpr'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6365
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6367
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6368

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6383
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6384
    'InternalError'('attempt to generate break label twice')
 __label_0: # endif
.annotate 'line', 6385
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6386
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6387
    .return($S1)
# }
.annotate 'line', 6388

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6391
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6392
    unless_null $P1, __label_0
.annotate 'line', 6393
    'InternalError'('attempt to get break label before creating it')
 __label_0: # endif
.annotate 'line', 6394
    .return($P1)
# }
.annotate 'line', 6395

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6379
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6404
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6405
    'InternalError'('attempt to generate continue label twice')
 __label_0: # endif
.annotate 'line', 6406
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6407
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6408
    .return($S1)
# }
.annotate 'line', 6409

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6412
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6413
    unless_null $P1, __label_0
.annotate 'line', 6414
    'InternalError'('attempt to get continue label before creating it')
 __label_0: # endif
.annotate 'line', 6415
    .return($P1)
# }
.annotate 'line', 6416

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6398
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6400
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6432
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6433
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6434
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6435
    __ARG_2.'unget'($P1)
.annotate 'line', 6436
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 6438

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6441
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6442
    if_null $P1, __label_0
.annotate 'line', 6443
    $P1 = $P1.'optimize'()
 __label_0: # endif
.annotate 'line', 6444
    .return(self)
# }
.annotate 'line', 6445

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6449
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6450
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
 __label_0:
.annotate 'line', 6453
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, [ 'ReturnStatement' ]
 __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6454
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6455
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6456
    self.'annotate'(__ARG_1)
.annotate 'line', 6457
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 6461
    le $I1, 0, __label_5
.annotate 'line', 6462
    $P1.'getargvalues'(__ARG_1)
 __label_5: # endif
.annotate 'line', 6464
    self.'annotate'(__ARG_1)
.annotate 'line', 6465
    self.'emitret'(__ARG_1)
.annotate 'line', 6466
    le $I1, 0, __label_6
.annotate 'line', 6467
    $P1.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6468
    __ARG_1.'say'(')')
# }
.annotate 'line', 6469

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6426
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6428
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6476
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6477

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6480
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6481

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6472
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6488
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6489

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6492
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6493

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6484
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6506
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6507
    setattribute self, 'name', __ARG_1
.annotate 'line', 6508
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6509
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6510

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6511
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6514
    self.'annotate'(__ARG_1)
.annotate 'line', 6515
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6516
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6517
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6518

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6500
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6502
    addattribute $P0, 'name'
.annotate 'line', 6503
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6532
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6533
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6534

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6535
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6538
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6539
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6540
    .return($S2)
# }
.annotate 'line', 6541

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6527
    addattribute $P0, 'owner'
.annotate 'line', 6528
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6554
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6555
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6556
    'RequireIdentifier'($P1)
.annotate 'line', 6557
    setattribute self, 'label', $P1
.annotate 'line', 6558
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6559

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6560
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6563
    self.'annotate'(__ARG_1)
.annotate 'line', 6564
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6565
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6566
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6567

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6548
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6550
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6578
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6579

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6582
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6583
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6584
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6585

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6574
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
# Body
# {
.annotate 'line', 6598
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6599
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6600
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6601
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6602
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6603
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6605
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6606
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6608

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6611
    self.'optimize_condition'()
.annotate 'line', 6612
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6613
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6614
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 6615
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6617
    getattribute $P1, self, 'truebranch'
    .return($P1)
 __label_3: # case
.annotate 'line', 6619
    getattribute $P2, self, 'falsebranch'
    .return($P2)
 __label_1: # default
 __label_0: # switch end
.annotate 'line', 6621
    .return(self)
# }
.annotate 'line', 6622

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6625
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6626
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6627
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6628
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6629
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6630
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6631
    $P3 = self.'genlabel'()
    set $S1, $P3
 __label_0: # endif
.annotate 'line', 6632
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 6633
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
 __label_3:
    set $S3, $S1
 __label_2:
.annotate 'line', 6634
    self.'annotate'(__ARG_1)
.annotate 'line', 6635
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6636
    $P1.'emit'(__ARG_1)
.annotate 'line', 6638
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6639
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6640
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6641
    $P2.'emit'(__ARG_1)
# }
 __label_4: # endif
.annotate 'line', 6643
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6644

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6592
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6594
    addattribute $P0, 'truebranch'
.annotate 'line', 6595
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6656
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6657

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6660
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6661
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6663
    self.'annotate'(__ARG_1)
.annotate 'line', 6664
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6665
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6666
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6667
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6668

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6651
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6653
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6679
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6680
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6681
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6682

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6685
    self.'optimize_condition'()
.annotate 'line', 6686
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6687
    .return(self)
# }
.annotate 'line', 6688

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6691
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6693
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 6696
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6699
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
 __label_4:
.annotate 'line', 6700
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 6702
    self.'annotate'(__ARG_1)
.annotate 'line', 6703
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6704
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6705
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6706
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6707
    __ARG_1.'emitlabel'($S1, 'endwhile')
 __label_0: # switch end
# }
.annotate 'line', 6709

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6675
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
# Body
# {
.annotate 'line', 6720
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6721
    self.'parsebody'(__ARG_2)
.annotate 'line', 6722
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6723
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6724

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6727
    self.'optimize_condition'()
.annotate 'line', 6728
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6729
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6730
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
 __label_0: # endif
.annotate 'line', 6731
    setattribute self, 'body', $P1
.annotate 'line', 6732
    .return(self)
# }
.annotate 'line', 6733

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6736
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6737
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 6738
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6740
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6743
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 6744
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
 __label_4:
.annotate 'line', 6745
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
 __label_5:
.annotate 'line', 6747
    self.'annotate'(__ARG_1)
.annotate 'line', 6748
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6750
    $P1.'emit'(__ARG_1)
.annotate 'line', 6751
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6752
    eq $I1, 2, __label_6
.annotate 'line', 6753
    self.'emit_if'(__ARG_1, $S1, $S2)
 __label_6: # endif
.annotate 'line', 6754
    __ARG_1.'emitlabel'($S2, 'enddo')
 __label_0: # switch end
# }
.annotate 'line', 6756

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6716
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
# Body
# {
.annotate 'line', 6767
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6768
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6769

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6770
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6773
    self.'annotate'(__ARG_1)
.annotate 'line', 6774
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6775
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6776

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6763
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6787
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6788
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6789

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6790
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6793
    self.'annotate'(__ARG_1)
.annotate 'line', 6794
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6795
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6796

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6783
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6812
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6813
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6814
    $P3 = $P1.'isop'('(')
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 6815
    'Expected'("'(' in switch", $P1)
 __label_0: # endif
.annotate 'line', 6816
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P4
.annotate 'line', 6817
    $P1 = __ARG_2.'get'()
.annotate 'line', 6818
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 6819
    'Expected'("')' in switch", $P1)
 __label_1: # endif
.annotate 'line', 6820
    $P1 = __ARG_2.'get'()
.annotate 'line', 6821
    $P3 = $P1.'isop'('{')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 6822
    'Expected'("'{' in switch", $P1)
 __label_2: # endif
.annotate 'line', 6823
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P4
.annotate 'line', 6824
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P4
.annotate 'line', 6825
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P4
 __label_4: # while
.annotate 'line', 6826
    $P1 = __ARG_2.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_5
    $I1 = $P1.'iskeyword'('default')
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 6827
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 6828
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_2, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6829
    $P1 = __ARG_2.'get'()
.annotate 'line', 6830
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_8
.annotate 'line', 6831
    'Expected'("':' in case", $P1)
 __label_8: # endif
.annotate 'line', 6832
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_10: # while
.annotate 'line', 6833
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
.annotate 'line', 6834
    __ARG_2.'unget'($P1)
.annotate 'line', 6835
    $P3 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P2, $P3
# }
    goto __label_10
 __label_9: # endwhile
.annotate 'line', 6837
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6838
    __ARG_2.'unget'($P1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 6841
    $P1 = __ARG_2.'get'()
.annotate 'line', 6842
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_13
.annotate 'line', 6843
    'Expected'("':' in default", $P1)
 __label_13: # endif
 __label_15: # while
.annotate 'line', 6844
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
.annotate 'line', 6845
    __ARG_2.'unget'($P1)
.annotate 'line', 6846
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P3, $P4
# }
    goto __label_15
 __label_14: # endwhile
.annotate 'line', 6848
    __ARG_2.'unget'($P1)
# }
 __label_7: # endif
# }
    goto __label_4
 __label_3: # endwhile
# }
.annotate 'line', 6851

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6854
    getattribute $P4, self, 'condition'
    $P3 = $P4.'optimize'()
    setattribute self, 'condition', $P3
.annotate 'line', 6855
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6856
    getattribute $P2, self, 'case_st'
    iter $P5, $P2
    set $P5, 0
 __label_0: # for iteration
    unless $P5 goto __label_1
    shift $P1, $P5
.annotate 'line', 6857
    'optimize_array'($P1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6858
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
.annotate 'line', 6859
    .return(self)
# }
.annotate 'line', 6860

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6864
# type: $S1
    set $S1, ''
.annotate 'line', 6865
    getattribute $P10, self, 'case_value'
    iter $P11, $P10
    set $P11, 0
 __label_0: # for iteration
    unless $P11 goto __label_1
    shift $P1, $P11
# {
.annotate 'line', 6866
# t: $S2
    $P12 = $P1.'checkresult'()
    null $S2
    if_null $P12, __label_2
    set $S2, $P12
 __label_2:
.annotate 'line', 6867
    ne $S2, 'N', __label_3
.annotate 'line', 6868
    getattribute $P10, self, 'start'
    'SyntaxError'("Invalid type in case", $P10)
 __label_3: # endif
.annotate 'line', 6869
    ne $S1, '', __label_4
.annotate 'line', 6870
    set $S1, $S2
    goto __label_5
 __label_4: # else
.annotate 'line', 6871
    eq $S1, $S2, __label_6
.annotate 'line', 6872
    set $S1, 'P'
 __label_6: # endif
 __label_5: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6875
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 6876
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 6880
    ne $S1, '', __label_7
.annotate 'line', 6881
    set $S1, $P3
 __label_7: # endif
.annotate 'line', 6883
# reg: $S3
    $P10 = self.'tempreg'($S1)
    null $S3
    if_null $P10, __label_8
    set $S3, $P10
 __label_8:
.annotate 'line', 6884
    set $S9, $P3
    ne $S9, $S1, __label_9
.annotate 'line', 6885
    $P2.'emit'(__ARG_1, $S3)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 6887
# regcond: $S4
    $P10 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_11
    set $S4, $P10
 __label_11:
.annotate 'line', 6888
    __ARG_1.'emitset'($S3, $S4)
# }
 __label_10: # endif
.annotate 'line', 6892
    self.'genbreaklabel'()
.annotate 'line', 6893
# defaultlabel: $S5
    $P10 = self.'genlabel'()
    null $S5
    if_null $P10, __label_12
    set $S5, $P10
 __label_12:
.annotate 'line', 6894
    new $P4, ['ResizableStringArray']
.annotate 'line', 6895
# regval: $S6
    $P10 = self.'tempreg'($S1)
    null $S6
    if_null $P10, __label_13
    set $S6, $P10
 __label_13:
.annotate 'line', 6896
    getattribute $P10, self, 'case_value'
    iter $P13, $P10
    set $P13, 0
 __label_14: # for iteration
    unless $P13 goto __label_15
    shift $P5, $P13
# {
.annotate 'line', 6897
# label: $S7
    $P12 = self.'genlabel'()
    null $S7
    if_null $P12, __label_16
    set $S7, $P12
 __label_16:
.annotate 'line', 6898
# predefined push
    push $P4, $S7
.annotate 'line', 6899
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 6900
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_14
 __label_15: # endfor
.annotate 'line', 6902
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6905
    __ARG_1.'comment'('switch')
.annotate 'line', 6906
    self.'annotate'(__ARG_1)
.annotate 'line', 6907
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 6908
# n: $I1
    set $P10, $P6
    set $I1, $P10
# for loop
.annotate 'line', 6909
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 6910
# l: $S8
    $S8 = $P4[$I2]
.annotate 'line', 6911
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6912
# var casest: $P7
    $P7 = $P6[$I2]
.annotate 'line', 6913
    iter $P14, $P7
    set $P14, 0
 __label_20: # for iteration
    unless $P14 goto __label_21
    shift $P8, $P14
.annotate 'line', 6914
    $P8.'emit'(__ARG_1)
    goto __label_20
 __label_21: # endfor
# }
 __label_17: # for iteration
.annotate 'line', 6909
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 6917
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6918
    getattribute $P10, self, 'default_st'
    iter $P15, $P10
    set $P15, 0
 __label_22: # for iteration
    unless $P15 goto __label_23
    shift $P9, $P15
.annotate 'line', 6919
    $P9.'emit'(__ARG_1)
    goto __label_22
 __label_23: # endfor
.annotate 'line', 6921
    getattribute $P12, self, 'start'
    $P10 = self.'getbreaklabel'($P12)
    __ARG_1.'emitlabel'($P10, 'switch end')
# }
.annotate 'line', 6922

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6803
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6805
    addattribute $P0, 'condition'
.annotate 'line', 6806
    addattribute $P0, 'case_value'
.annotate 'line', 6807
    addattribute $P0, 'case_st'
.annotate 'line', 6808
    addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6936
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6937
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6938
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6939
    __ARG_2.'unget'($P1)
.annotate 'line', 6940
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
 __label_0: # endif
.annotate 'line', 6942
    $P1 = __ARG_2.'get'()
.annotate 'line', 6943
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6944
    __ARG_2.'unget'($P1)
.annotate 'line', 6945
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6946
    'ExpectOp'(';', __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 6948
    $P1 = __ARG_2.'get'()
.annotate 'line', 6949
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 6950
    __ARG_2.'unget'($P1)
.annotate 'line', 6951
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 6952
    'ExpectOp'(')', __ARG_2)
# }
 __label_2: # endif
.annotate 'line', 6954
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6955

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6958
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 6959
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
 __label_0: # endif
.annotate 'line', 6960
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 6961
    self.'optimize_condition'()
 __label_1: # endif
.annotate 'line', 6962
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 6963
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
 __label_2: # endif
.annotate 'line', 6964
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6965
    .return(self)
# }
.annotate 'line', 6966

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6969
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 6970
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6971
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 6972
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 6973
    .return()
# }
 __label_0: # endif
.annotate 'line', 6975
    __ARG_1.'comment'('for loop')
.annotate 'line', 6976
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
 __label_3:
.annotate 'line', 6977
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
 __label_4:
.annotate 'line', 6978
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
 __label_5:
.annotate 'line', 6979
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 6980
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6982
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6983
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 6984
    self.'emit_else'(__ARG_1, $S2)
 __label_7: # endif
.annotate 'line', 6986
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6987
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6988
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 6989
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
 __label_8: # endif
.annotate 'line', 6990
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 6992
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6993

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6929
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 6931
    addattribute $P0, 'initializer'
.annotate 'line', 6932
    addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
# Body
# {
.annotate 'line', 7008
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7009
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7010
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 7011
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 7012
    self.'createvar'($S1, $S2)
.annotate 'line', 7013
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
 __label_1: # endif
.annotate 'line', 7015
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7016
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7017
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 7018
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7019

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7022
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7023
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7024
    .return(self)
# }
.annotate 'line', 7025

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7028
    self.'annotate'(__ARG_1)
.annotate 'line', 7029
# regcont: $S1
    null $S1
.annotate 'line', 7030
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 7031
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 7032
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7033
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7036
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 7037
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7038
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7039
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
 __label_4:
.annotate 'line', 7040
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
 __label_5:
.annotate 'line', 7041
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7042
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7043
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7044
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7045
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7046
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7047
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7048
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7049

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7000
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7002
    addattribute $P0, 'deftype'
.annotate 'line', 7003
    addattribute $P0, 'varname'
.annotate 'line', 7004
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7056
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 7057
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7058
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7059
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 7060
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7062
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7063
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 7064
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 7065
    __ARG_2.'unget'($P3)
.annotate 'line', 7066
    __ARG_2.'unget'($P2)
.annotate 'line', 7067
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
.annotate 'line', 7069
    new $P5, [ 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7070

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7082
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7083
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7084

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7087
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7088
    .return(self)
# }
.annotate 'line', 7089

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7092
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7093
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7094
    self.'annotate'(__ARG_1)
.annotate 'line', 7095
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 7097
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_1 # break
 __label_4: # case
.annotate 'line', 7100
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_1 # break
 __label_2: # default
.annotate 'line', 7103
    getattribute $P3, self, 'start'
    'SyntaxError'("Invalid throw argument", $P3)
 __label_1: # switch end
# }
.annotate 'line', 7105

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7076
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7078
    addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7121
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7122
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7123
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7124
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_1
 __label_0: # else
.annotate 'line', 7126
    __ARG_2.'unget'($P1)
 __label_1: # endif
.annotate 'line', 7128
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7129
    $P1 = __ARG_2.'get'()
.annotate 'line', 7130
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7131
    'ExpectedOp'('catch', $P1)
 __label_2: # endif
.annotate 'line', 7132
    $P1 = __ARG_2.'get'()
.annotate 'line', 7133
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7134
    'Expected'("'(' after 'catch'", $P1)
 __label_3: # endif
.annotate 'line', 7135
    $P1 = __ARG_2.'get'()
.annotate 'line', 7136
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 7137
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
 __label_5:
.annotate 'line', 7138
    setattribute self, 'exname', $P1
.annotate 'line', 7139
    self.'createvar'($S1, 'P')
.annotate 'line', 7140
    $P1 = __ARG_2.'get'()
.annotate 'line', 7141
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 7142
    'Expected'("')' in 'catch'", $P1)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 7144
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7145

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7148
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 7149
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
 __label_0: # endif
.annotate 'line', 7150
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7151
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7152
    .return(self)
# }
.annotate 'line', 7153

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7156
# reghandler: $S1
    $P7 = self.'tempreg'('P')
    null $S1
    if_null $P7, __label_0
    set $S1, $P7
 __label_0:
.annotate 'line', 7157
# labelhandler: $S2
    $P7 = self.'genlabel'()
    null $S2
    if_null $P7, __label_1
    set $S2, $P7
 __label_1:
.annotate 'line', 7158
# labelpasthandler: $S3
    $P7 = self.'genlabel'()
    null $S3
    if_null $P7, __label_2
    set $S3, $P7
 __label_2:
.annotate 'line', 7159
# exreg: $S4
    null $S4
.annotate 'line', 7160
    getattribute $P7, self, 'exname'
    if_null $P7, __label_3
# {
.annotate 'line', 7161
# var exname: $P1
    getattribute $P8, self, 'exname'
    $P1 = self.'getvar'($P8)
.annotate 'line', 7162
    $P7 = $P1.'getreg'()
    set $S4, $P7
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 7165
    $P7 = self.'tempreg'('P')
    set $S4, $P7
 __label_4: # endif
.annotate 'line', 7167
    self.'annotate'(__ARG_1)
.annotate 'line', 7168
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7170
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7171
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7173
    getattribute $P7, self, 'modifiers'
    if_null $P7, __label_5
# {
.annotate 'line', 7174
# var modiflist: $P2
    getattribute $P8, self, 'modifiers'
    $P2 = $P8.'getlist'()
.annotate 'line', 7175
    iter $P9, $P2
    set $P9, 0
 __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P3, $P9
# {
.annotate 'line', 7176
# modifname: $S5
    $P7 = $P3.'getname'()
    null $S5
    if_null $P7, __label_8
    set $S5, $P7
 __label_8:
.annotate 'line', 7177
# nargs: $I1
    $P7 = $P3.'numargs'()
    set $I1, $P7
.annotate 'line', 7178
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
.annotate 'line', 7181
    eq $I1, 1, __label_15
.annotate 'line', 7182
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
 __label_15: # endif
.annotate 'line', 7183
# var arg: $P4
    $P4 = $P3.'getarg'(0)
.annotate 'line', 7184
# argreg: $S6
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S6
    if_null $P8, __label_16
    set $S6, $P8
 __label_16:
.annotate 'line', 7185
    __ARG_1.'say'('    ', $S1, ".'", $S5, "'(", $S6, ")")
    goto __label_9 # break
 __label_13: # case
 __label_14: # case
.annotate 'line', 7189
    new $P5, ['ResizableStringArray']
# for loop
.annotate 'line', 7190
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 7191
# var arg: $P6
    $P6 = $P3.'getarg'($I2)
.annotate 'line', 7192
    $P7 = $P6.'emit_get'(__ARG_1)
# predefined push
    push $P5, $P7
# }
 __label_17: # for iteration
.annotate 'line', 7190
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 7195
# predefined join
    join $S7, ', ', $P5
.annotate 'line', 7194
    __ARG_1.'say'('    ', $S1, ".'", $S5, "'(", $S7, ")")
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 7198
    getattribute $P7, self, 'start'
    'SyntaxError'('Unexpected modifier in try', $P7)
 __label_9: # switch end
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 7203
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7204
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7205
    getattribute $P7, self, 'stry'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7206
    __ARG_1.'comment'('try: end')
.annotate 'line', 7207
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7209
    self.'annotate'(__ARG_1)
.annotate 'line', 7210
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7212
    __ARG_1.'comment'('catch')
.annotate 'line', 7213
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7214
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7215
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7216
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7217
    getattribute $P7, self, 'scatch'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7219
    __ARG_1.'comment'('catch end')
.annotate 'line', 7220
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7221

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7112
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7114
    addattribute $P0, 'stry'
.annotate 'line', 7115
    addattribute $P0, 'modifiers'
.annotate 'line', 7116
    addattribute $P0, 'exname'
.annotate 'line', 7117
    addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7234
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7235
    setattribute self, 'name', __ARG_3
.annotate 'line', 7236
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7237
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7238

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7228
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7230
    addattribute $P0, 'name'
.annotate 'line', 7231
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 7253
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7254
    setattribute self, 'name', __ARG_3
.annotate 'line', 7255
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7256

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7245
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7247
    addattribute $P0, 'name'
.annotate 'line', 7248
    addattribute $P0, 'basetype'
.annotate 'line', 7249
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7267
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7268
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7269
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7270
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7271
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7273
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7276
    __ARG_5.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 7277

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7280
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7281
    if_null $P1, __label_0
.annotate 'line', 7282
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7283
    .return(self)
# }
.annotate 'line', 7284

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7287
    self.'annotate'(__ARG_1)
.annotate 'line', 7288
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7289
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7290
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7291
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7292
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7294
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7295
    __ARG_1.'emitnull'($S2)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7297
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
 __label_6:
.annotate 'line', 7298
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7299
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, [ 'ConcatString' ]
 __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7300
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
.annotate 'line', 7302
    $P1.'emit'(__ARG_1, $S2)
 __label_10: # endif
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7305
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_12
# {
.annotate 'line', 7307
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 7310
# ireg: $S5
    null $S5
.annotate 'line', 7311
    ne $S4, '', __label_14
.annotate 'line', 7312
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
 __label_14: # else
# {
.annotate 'line', 7314
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7315
    $P1.'emit'(__ARG_1, $S5)
# }
 __label_15: # endif
.annotate 'line', 7317
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
 __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7318
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
 __label_19:
.annotate 'line', 7319
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7320
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7321
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7322
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
 __label_16: # else
.annotate 'line', 7325
    __ARG_1.'emitset'($S2, $S5)
 __label_17: # endif
# }
 __label_13: # endif
# }
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 7329

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7261
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7263
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
# Body
# {
.annotate 'line', 7344
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7345
    box $P4, __ARG_5
    setattribute self, 'arraytype', $P4
.annotate 'line', 7346
# var vdata: $P1
    getattribute $P4, self, 'name'
    $P1 = self.'createvar'($P4, 'P')
.annotate 'line', 7347
    $P5 = $P1.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 7348
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7349
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_0
# {
.annotate 'line', 7351
    __ARG_6.'unget'($P2)
.annotate 'line', 7352
    $P5 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P5
.annotate 'line', 7353
    'ExpectOp'(']', __ARG_6)
# }
 __label_0: # endif
.annotate 'line', 7355
    $P2 = __ARG_6.'get'()
.annotate 'line', 7356
    $P4 = $P2.'isop'('=')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7357
    $P2 = __ARG_6.'get'()
.annotate 'line', 7358
    $P4 = $P2.'isop'('[')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 7359
    'Expected'("array initializer", $P2)
 __label_3: # endif
.annotate 'line', 7360
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P5
.annotate 'line', 7361
    $P2 = __ARG_6.'get'()
.annotate 'line', 7362
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_4
# {
.annotate 'line', 7363
    __ARG_6.'unget'($P2)
 __label_5: # do
.annotate 'line', 7364
# {
.annotate 'line', 7365
# var item: $P3
    $P3 = 'parseExpr'(__ARG_6, self)
.annotate 'line', 7366
    getattribute $P4, self, 'initarray'
# predefined push
    push $P4, $P3
# }
 __label_7: # continue
.annotate 'line', 7367
    $P2 = __ARG_6.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 7368
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_8
.annotate 'line', 7369
    'Expected'("',' or ']'", $P2)
 __label_8: # endif
# }
 __label_4: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 7373
    __ARG_6.'unget'($P2)
 __label_2: # endif
# }
.annotate 'line', 7374

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7377
    getattribute $P1, self, 'size'
    if_null $P1, __label_0
.annotate 'line', 7378
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
 __label_0: # endif
.annotate 'line', 7379
    getattribute $P1, self, 'initarray'
    'optimize_array'($P1)
.annotate 'line', 7380
    .return(self)
# }
.annotate 'line', 7381

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7384
    self.'annotate'(__ARG_1)
.annotate 'line', 7386
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7387
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7388
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7389
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7390
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7391
    if_null $P2, __label_0
# {
.annotate 'line', 7393
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
 __label_2:
.annotate 'line', 7394
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7398
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
 __label_1: # endif
.annotate 'line', 7400
    if_null $P3, __label_3
# {
.annotate 'line', 7401
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
 __label_4:
.annotate 'line', 7402
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7403
    unless_null $P2, __label_5
# {
.annotate 'line', 7404
    le $I1, 0, __label_6
# {
.annotate 'line', 7406
    __ARG_1.'emitset'($P1, $I1)
# }
 __label_6: # endif
# }
 __label_5: # endif
.annotate 'line', 7409
# i: $I2
    null $I2
.annotate 'line', 7410
    iter $P7, $P3
    set $P7, 0
 __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7411
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7412
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7413
    inc $I2
# }
    goto __label_7
 __label_8: # endfor
# }
 __label_3: # endif
# }
.annotate 'line', 7416

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7334
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7336
    addattribute $P0, 'size'
.annotate 'line', 7337
    addattribute $P0, 'initarray'
.annotate 'line', 7338
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7423
# var next: $P1
    null $P1
.annotate 'line', 7424
# var r: $P2
    null $P2
 __label_0: # do
.annotate 'line', 7425
# {
.annotate 'line', 7426
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7427
    'RequireIdentifier'($P3)
.annotate 'line', 7428
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7429
# var item: $P5
    null $P5
.annotate 'line', 7430
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7431
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7433
    __ARG_4.'unget'($P4)
.annotate 'line', 7434
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
 __label_4: # endif
.annotate 'line', 7436
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7437
    $P1 = __ARG_4.'get'()
# }
 __label_2: # continue
.annotate 'line', 7438
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
 __label_1: # enddo
.annotate 'line', 7439
    'RequireOp'(';', $P1)
.annotate 'line', 7440
    .return($P2)
# }
.annotate 'line', 7441

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7449
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7450

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7445
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7457
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7458

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7453
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7464
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7465

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7469
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7470

.end # newIntArray


.sub 'parseInt'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7474
.const 'Sub' $P1 = 'newIntSingle'
.annotate 'line', 7475
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7476
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7477

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7485
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7486

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7481
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7493
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7494

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7489
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7500
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7501

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7505
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7506

.end # newFloatArray


.sub 'parseFloat'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7510
.const 'Sub' $P1 = 'newFloatSingle'
.annotate 'line', 7511
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7512
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7513

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7521
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7522

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7517
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7529
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7530

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7525
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7536
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7537

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7541
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7542

.end # newStringArray


.sub 'parseString'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7546
.const 'Sub' $P1 = 'newStringSingle'
.annotate 'line', 7547
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7548
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7549

.end # parseString

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7564
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7565
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7566
    setattribute self, 'name', __ARG_4
.annotate 'line', 7567
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7568

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7571
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7572
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7573
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 7574
    $P1 = $P1.'optimize'()
.annotate 'line', 7575
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7577
    getattribute $P4, self, 'start'
.annotate 'line', 7576
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
 __label_1: # endif
.annotate 'line', 7579
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7580
    setattribute self, 'value', $P1
.annotate 'line', 7581
    .return(self)
# }
.annotate 'line', 7582

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 7585
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7586

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7589
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7590
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7591

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7555
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7557
    addattribute $P0, 'type'
.annotate 'line', 7558
    addattribute $P0, 'name'
.annotate 'line', 7559
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7596
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7597
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 7598
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
 __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7599
    'SyntaxError'('Invalid type for const', __ARG_1)
 __label_1: # endif
.annotate 'line', 7601
# var multi: $P2
    null $P2
 __label_4: # do
.annotate 'line', 7602
# {
.annotate 'line', 7603
    $P1 = __ARG_2.'get'()
.annotate 'line', 7604
# var name: $P3
    set $P3, $P1
.annotate 'line', 7605
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7606
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7608
    new $P6, [ 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7607
    $P2 = 'addtomulti'($P2, $P5)
# }
 __label_6: # continue
.annotate 'line', 7609
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
 __label_5: # enddo
.annotate 'line', 7610
    .return($P2)
# }
.annotate 'line', 7611

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 7622
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7623
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7624
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7625
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7626
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 7628
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7629

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7632
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7633
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7634
    .return(self)
# }
.annotate 'line', 7635

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7638
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7639

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7642
    self.'annotate'(__ARG_1)
.annotate 'line', 7643
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7644
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7645
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7646
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7647
    if_null $P1, __label_2
.annotate 'line', 7648
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7649
    null $P1
 __label_3: # endif
 __label_2: # endif
.annotate 'line', 7650
    if_null $P1, __label_4
# {
.annotate 'line', 7651
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 7652
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
.annotate 'line', 7654
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
 __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
 __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7655
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
 __label_14: # else
.annotate 'line', 7657
    $P1.'emit'(__ARG_1, $S2)
 __label_15: # endif
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
 __label_12: # case
.annotate 'line', 7662
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
 __label_18:
.annotate 'line', 7663
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
 __label_13: # case
.annotate 'line', 7666
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
 __label_8: # default
.annotate 'line', 7668
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
 __label_7: # switch end
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 7672
    __ARG_1.'emitnull'($S2)
 __label_5: # endif
# }
.annotate 'line', 7673

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7617
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7619
    addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7680
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7681
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7682

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7685
    self.'annotate'(__ARG_1)
.annotate 'line', 7686
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7687
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7688
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7689
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7690

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7676
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7699
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7700
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7701
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7702
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7703

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7706
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7707
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7708

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7711
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7712
    self.'annotate'(__ARG_1)
.annotate 'line', 7713
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7714
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 7715
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7716
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7717

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7693
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7695
    addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7722
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7723
    'RequireIdentifier'($P1)
.annotate 'line', 7724
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7725
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7726
    $P2 = __ARG_2.'get'()
.annotate 'line', 7727
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7728
    new $P5, [ 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 7730
    __ARG_2.'unget'($P2)
.annotate 'line', 7731
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
.annotate 'line', 7735
    __ARG_2.'unget'($P2)
.annotate 'line', 7736
    new $P4, [ 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 7738

.end # parseVar


.sub 'parseVolatile'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7742
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7743
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7744
    'SyntaxError'("invalid volatile type", $P1)
 __label_0: # endif
.annotate 'line', 7745
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7746

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7759
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7760
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7761
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7762
# var t: $P1
    null $P1
 __label_1: # while
.annotate 'line', 7763
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7764
    __ARG_2.'unget'($P1)
.annotate 'line', 7765
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7766
    unless_null $P2, __label_2
.annotate 'line', 7767
    'InternalError'('Unexpected null statement')
 __label_2: # endif
.annotate 'line', 7768
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 7770
    setattribute self, 'end', $P1
# }
.annotate 'line', 7771

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7774
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7775
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7776
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7777
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7778
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
 __label_1: # endif
.annotate 'line', 7779
    .return($S2)
# }
.annotate 'line', 7780

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7783
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7784
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7785
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7786
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7787
    'SyntaxError'('Label already defined', __ARG_1)
 __label_1: # endif
.annotate 'line', 7788
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7789
    $P1[$S1] = $S3
.annotate 'line', 7790
    .return($S3)
# }
.annotate 'line', 7791

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 7792
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7795
    __ARG_1.'comment'('{')
.annotate 'line', 7796
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7797
    $P1.'emit'(__ARG_1)
.annotate 'line', 7798
    self.'freetemps'()
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7800
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7801

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7752
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7754
    addattribute $P0, 'end'
.annotate 'line', 7755
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7816
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7818
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7819
    new $P1, ['ResizableStringArray']
.annotate 'line', 7820
    new $P2, ['ResizableStringArray']
.annotate 'line', 7821
    setattribute self, 'tempreg', $P1
.annotate 'line', 7822
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7823

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 7826
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7827
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7828
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7829
    assign $P1, $I1
.annotate 'line', 7830
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
 __label_0:
.annotate 'line', 7831
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7832
    .return($S1)
# }
.annotate 'line', 7833

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 7836
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7837
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7838
# reg: $S1
    null $S1
.annotate 'line', 7839
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7840
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7842
    $P4 = self.'createreg'()
    set $S1, $P4
 __label_1: # endif
.annotate 'line', 7843
# predefined push
    push $P2, $S1
.annotate 'line', 7844
    .return($S1)
# }
.annotate 'line', 7845

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 7848
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7849
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7850
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7851
# i: $I2
    sub $I2, $I1, 1
 __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7852
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7853
# predefined push
    push $P1, $S1
# }
 __label_0: # for iteration
.annotate 'line', 7851
    dec $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 7855
    assign $P2, 0
# }
.annotate 'line', 7856

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7810
    addattribute $P0, 'type'
.annotate 'line', 7811
    addattribute $P0, 'nreg'
.annotate 'line', 7812
    addattribute $P0, 'tempreg'
.annotate 'line', 7813
    addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7869
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7870
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = 'typetoregcheck'($P3)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7871
    eq $S1, '', __label_1
.annotate 'line', 7872
    $P1 = __ARG_2.'get'()
    goto __label_2
 __label_1: # else
.annotate 'line', 7874
    set $S1, 'P'
 __label_2: # endif
.annotate 'line', 7875
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 7876
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 7878
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 7879
    $P1 = __ARG_2.'get'()
.annotate 'line', 7880
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7881
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_4
 __label_3: # else
.annotate 'line', 7883
    __ARG_2.'unget'($P1)
 __label_4: # endif
# }
.annotate 'line', 7884

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7887
# paramname: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_0
    set $S1, $P8
 __label_0:
.annotate 'line', 7888
# var param: $P1
    $P1 = __ARG_1.'getvar'($S1)
.annotate 'line', 7889
# ptype: $S2
    $P9 = $P1.'gettype'()
    $P8 = 'typetopirname'($P9)
    null $S2
    if_null $P8, __label_1
    set $S2, $P8
 __label_1:
.annotate 'line', 7890
    $P8 = $P1.'getreg'()
    __ARG_2.'print'('        .param ', $S2, ' ', $P8)
.annotate 'line', 7891
# var modarg: $P2
    getattribute $P2, self, 'modifiers'
.annotate 'line', 7892
    if_null $P2, __label_2
# {
.annotate 'line', 7893
# var named: $P3
    null $P3
.annotate 'line', 7894
# var slurpy: $P4
    null $P4
.annotate 'line', 7895
# var modarglist: $P5
    $P5 = $P2.'getlist'()
.annotate 'line', 7896
    iter $P10, $P5
    set $P10, 0
 __label_3: # for iteration
    unless $P10 goto __label_4
    shift $P6, $P10
# {
.annotate 'line', 7897
# modname: $S3
    $P8 = $P6.'getname'()
    null $S3
    if_null $P8, __label_5
    set $S3, $P8
 __label_5:
.annotate 'line', 7898
    set $S5, $S3
    set $S6, 'named'
    if $S5 == $S6 goto __label_8
    set $S6, 'slurpy'
    if $S5 == $S6 goto __label_9
    goto __label_7
# switch
 __label_8: # case
.annotate 'line', 7900
    set $P3, $P6
    goto __label_6 # break
 __label_9: # case
.annotate 'line', 7903
    set $P4, $P6
    goto __label_6 # break
 __label_7: # default
.annotate 'line', 7906
    __ARG_2.'print'(' :', $S3)
 __label_6: # switch end
# }
    goto __label_3
 __label_4: # endfor
.annotate 'line', 7909
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_12
    isnull $I2, $P4
    not $I2
 __label_12:
    unless $I2 goto __label_10
# {
.annotate 'line', 7914
    __ARG_2.'print'(" :named :slurpy")
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 7917
    if_null $P3, __label_13
# {
.annotate 'line', 7918
# setname: $S4
    null $S4
.annotate 'line', 7919
# nargs: $I1
    $P8 = $P3.'numargs'()
    set $I1, $P8
.annotate 'line', 7920
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_17
    set $I3, 1
    if $I2 == $I3 goto __label_18
    goto __label_16
# switch
 __label_17: # case
.annotate 'line', 7922
    concat $S0, "'", $S1
    concat $S0, $S0, "'"
    set $S4, $S0
    goto __label_15 # break
 __label_18: # case
.annotate 'line', 7925
# var argmod: $P7
    $P7 = $P3.'getarg'(0)
.annotate 'line', 7926
    $P8 = $P7.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_19
.annotate 'line', 7927
    getattribute $P9, __ARG_1, 'start'
    'SyntaxError'('Invalid modifier', $P9)
 __label_19: # endif
.annotate 'line', 7928
    $P11 = $P7.'getPirString'()
    set $S4, $P11
    goto __label_15 # break
 __label_16: # default
.annotate 'line', 7931
    getattribute $P12, __ARG_1, 'start'
    'SyntaxError'('Invalid modifier', $P12)
 __label_15: # switch end
.annotate 'line', 7933
    __ARG_2.'print'(" :named(", $S4, ")")
# }
    goto __label_14
 __label_13: # else
.annotate 'line', 7935
    if_null $P4, __label_20
# {
.annotate 'line', 7936
    __ARG_2.'print'(" :slurpy")
# }
 __label_20: # endif
 __label_14: # endif
# }
 __label_11: # endif
# }
 __label_2: # endif
.annotate 'line', 7940
    __ARG_2.'say'('')
# }
.annotate 'line', 7941

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 7865
    addattribute $P0, 'name'
.annotate 'line', 7866
    addattribute $P0, 'modifiers'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7967
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7968
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 7969
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 7970
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 7971
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 7972
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 7973
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 7974

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 7976
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 7980
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 7981
    unless_null $P1, __label_0
# {
.annotate 'line', 7982
    $P1 = self.'generatesubid'()
.annotate 'line', 7983
    setattribute self, 'subid', $P1
# }
 __label_0: # endif
.annotate 'line', 7985
    .return($P1)
# }
.annotate 'line', 7986

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7990
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 7991
    .return($I1)
# }
.annotate 'line', 7992

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7995
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 7996
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 7997
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7998
    __ARG_1.'unget'($P2)
 __label_1: # do
.annotate 'line', 7999
# {
.annotate 'line', 8000
    new $P4, [ 'FunctionParameter' ]
    $P4.'FunctionParameter'(self, __ARG_1)
    set $P3, $P4
# predefined push
    push $P1, $P3
.annotate 'line', 8001
    $P2 = __ARG_1.'get'()
# }
 __label_3: # continue
.annotate 'line', 8002
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 8003
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8004
    'Expected'("')' or ','", $P2)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8006

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8010
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8011
    unless_null $P1, __label_0
.annotate 'line', 8012
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 8014
# predefined push
    push $P1, __ARG_1
 __label_1: # endif
# }
.annotate 'line', 8015

.end # addlocalfunction


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8019
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8020
    .return(self)
# }
.annotate 'line', 8021

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8025
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8026
    unless_null $P1, __label_0
# {
.annotate 'line', 8027
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8028
    setattribute self, 'usedlexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 8030
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8031

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8034
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8035
    unless_null $P1, __label_0
# {
.annotate 'line', 8036
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8037
    setattribute self, 'lexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 8039
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8040

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8045
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8046
# lexname: $S1
    null $S1
.annotate 'line', 8047
    if_null $P1, __label_0
.annotate 'line', 8048
    set $S1, $P1
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 8050
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 8051
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8052
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8053
    self.'setlex'($S1, $S2)
.annotate 'line', 8054
    __ARG_1.'setlex'($S1)
# }
 __label_1: # endif
.annotate 'line', 8056
    .return($S1)
# }
.annotate 'line', 8057

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8061
# var store: $P1
    null $P1
.annotate 'line', 8062
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
.annotate 'line', 8064
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 8066
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 8068
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 8070
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 8072
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8074
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8075
    .return($S1)
# }
.annotate 'line', 8076

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8079
# var store: $P1
    null $P1
.annotate 'line', 8080
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
.annotate 'line', 8082
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 8084
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 8086
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 8088
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 8090
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8092
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8093
    .return($S1)
# }
.annotate 'line', 8094

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8097
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
.annotate 'line', 8098
    $P1.'freetemps'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 8099

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8102
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 8103
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8104
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 8105
    assign $P1, $I1
.annotate 'line', 8106
    .return($S1)
# }
.annotate 'line', 8107

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8110
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 8111

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8114
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8115

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8119
# name: $S1
    getattribute $P13, self, 'name'
    null $S1
    if_null $P13, __label_0
    set $S1, $P13
 __label_0:
.annotate 'line', 8120
    __ARG_1.'say'()
.annotate 'line', 8121
    __ARG_1.'print'(".sub ")
.annotate 'line', 8122
    $P13 = self.'isanonymous'()
    if_null $P13, __label_1
    unless $P13 goto __label_1
.annotate 'line', 8123
    __ARG_1.'print'("'' :anon")
    goto __label_2
 __label_1: # else
.annotate 'line', 8125
    __ARG_1.'print'("'", $S1, "'")
 __label_2: # endif
.annotate 'line', 8126
    getattribute $P13, self, 'subid'
    if_null $P13, __label_3
.annotate 'line', 8127
    getattribute $P14, self, 'subid'
    __ARG_1.'print'(" :subid('", $P14, "')")
 __label_3: # endif
.annotate 'line', 8128
    getattribute $P13, self, 'outer'
    if_null $P13, __label_4
# {
.annotate 'line', 8129
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8130
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8131
    if_null $P2, __label_5
.annotate 'line', 8132
    __ARG_1.'print'(" :outer('", $P2, "')")
 __label_5: # endif
# }
 __label_4: # endif
.annotate 'line', 8136
    $P13 = self.'ismethod'()
    if_null $P13, __label_6
    unless $P13 goto __label_6
.annotate 'line', 8137
    __ARG_1.'print'(' :method')
 __label_6: # endif
.annotate 'line', 8138
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8139
    if_null $P3, __label_7
# {
.annotate 'line', 8140
# var mlist: $P4
    $P4 = $P3.'getlist'()
.annotate 'line', 8141
    iter $P15, $P4
    set $P15, 0
 __label_9: # for iteration
    unless $P15 goto __label_10
    shift $P5, $P15
# {
.annotate 'line', 8142
# nargmods: $I1
    $P13 = $P5.'numargs'()
    set $I1, $P13
.annotate 'line', 8143
    $P13 = $P5.'getname'()
    __ARG_1.'print'(' :', $P13)
.annotate 'line', 8144
    le $I1, 0, __label_11
# {
.annotate 'line', 8145
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8146
# iargmod: $I2
    null $I2
 __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 8147
# var argmod: $P6
    $P6 = $P5.'getarg'($I2)
.annotate 'line', 8148
    $P13 = $P6.'isstringliteral'()
    isfalse $I4, $P13
    unless $I4 goto __label_15
.annotate 'line', 8149
    getattribute $P14, $P6, 'start'
    'SyntaxError'('Invalid modifier', $P14)
 __label_15: # endif
.annotate 'line', 8150
    $P13 = $P6.'getPirString'()
    __ARG_1.'print'($P13)
# }
 __label_12: # for iteration
.annotate 'line', 8146
    inc $I2
    goto __label_14
 __label_13: # for end
.annotate 'line', 8152
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
.annotate 'line', 8157
    ne $S1, 'main', __label_16
.annotate 'line', 8158
    __ARG_1.'print'(' :main')
 __label_16: # endif
# }
 __label_8: # endif
.annotate 'line', 8160
    __ARG_1.'say'()
.annotate 'line', 8163
    getattribute $P13, self, 'params'
    iter $P16, $P13
    set $P16, 0
 __label_17: # for iteration
    unless $P16 goto __label_18
    shift $P7, $P16
.annotate 'line', 8164
    $P7.'emit'(self, __ARG_1)
    goto __label_17
 __label_18: # endfor
.annotate 'line', 8166
# var lexicals: $P8
    getattribute $P8, self, 'lexicals'
.annotate 'line', 8167
# var usedlexicals: $P9
    getattribute $P9, self, 'usedlexicals'
.annotate 'line', 8168
    isnull $I4, $P8
    not $I4
    if $I4 goto __label_20
    isnull $I4, $P9
    not $I4
 __label_20:
    unless $I4 goto __label_19
# {
.annotate 'line', 8169
    getattribute $P13, self, 'start'
    __ARG_1.'annotate'($P13)
.annotate 'line', 8171
    if_null $P8, __label_21
# {
.annotate 'line', 8173
    iter $P17, $P8
    set $P17, 0
 __label_22: # for iteration
    unless $P17 goto __label_23
    shift $S2, $P17
.annotate 'line', 8174
    $P13 = $P8[$S2]
    __ARG_1.'say'(".lex '", $P13, "', ", $S2)
    goto __label_22
 __label_23: # endfor
# }
 __label_21: # endif
.annotate 'line', 8177
    if_null $P9, __label_24
# {
.annotate 'line', 8179
    iter $P18, $P9
    set $P18, 0
 __label_25: # for iteration
    unless $P18 goto __label_26
    shift $S3, $P18
.annotate 'line', 8180
    $P13 = $P9[$S3]
    __ARG_1.'emitfind_lex'($S3, $P13)
    goto __label_25
 __label_26: # endfor
# }
 __label_24: # endif
# }
 __label_19: # endif
.annotate 'line', 8184
# var body: $P10
    getattribute $P10, self, 'body'
.annotate 'line', 8185
    $P13 = $P10.'isempty'()
    if_null $P13, __label_27
    unless $P13 goto __label_27
.annotate 'line', 8186
    __ARG_1.'comment'('Empty body')
    goto __label_28
 __label_27: # else
# {
.annotate 'line', 8188
    __ARG_1.'comment'('Body')
.annotate 'line', 8189
    $P10.'emit'(__ARG_1)
.annotate 'line', 8190
    $P13 = $P10.'getend'()
    __ARG_1.'annotate'($P13)
# }
 __label_28: # endif
.annotate 'line', 8192
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8195
# var localfun: $P11
    getattribute $P11, self, 'localfun'
.annotate 'line', 8196
    if_null $P11, __label_29
# {
# for loop
.annotate 'line', 8197
# ifn: $I3
    null $I3
 __label_32: # for condition
# predefined elements
    elements $I4, $P11
    ge $I3, $I4, __label_31
# {
.annotate 'line', 8198
# var fn: $P12
    $P12 = $P11[$I3]
.annotate 'line', 8199
    $P12.'emit'(__ARG_1)
# }
 __label_30: # for iteration
.annotate 'line', 8197
    inc $I3
    goto __label_32
 __label_31: # for end
# }
 __label_29: # endif
# }
.annotate 'line', 8202

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7948
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7950
    addattribute $P0, 'name'
.annotate 'line', 7951
    addattribute $P0, 'subid'
.annotate 'line', 7952
    addattribute $P0, 'modifiers'
.annotate 'line', 7953
    addattribute $P0, 'params'
.annotate 'line', 7954
    addattribute $P0, 'body'
.annotate 'line', 7955
    addattribute $P0, 'regstI'
.annotate 'line', 7956
    addattribute $P0, 'regstN'
.annotate 'line', 7957
    addattribute $P0, 'regstS'
.annotate 'line', 7958
    addattribute $P0, 'regstP'
.annotate 'line', 7959
    addattribute $P0, 'nlabel'
.annotate 'line', 7960
    addattribute $P0, 'localfun'
.annotate 'line', 7961
    addattribute $P0, 'lexicals'
.annotate 'line', 7962
    addattribute $P0, 'usedlexicals'
.annotate 'line', 7963
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8216
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8217
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8218
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8219
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8220

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8222
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8226
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8227
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8228
    assign $P1, $I1
.annotate 'line', 8229
    .return($I1)
# }
.annotate 'line', 8230

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8234
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8235
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8236
    assign $P1, $I1
.annotate 'line', 8237
    .return($I1)
# }
.annotate 'line', 8238

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8239
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8243
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8244
    setattribute self, 'name', $P1
.annotate 'line', 8245
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8246
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 8247
    new $P7, [ 'ModifierList' ]
    $P7.'ModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8248
    $P2 = __ARG_1.'get'()
# }
 __label_0: # endif
.annotate 'line', 8250
    'RequireOp'('(', $P2)
.annotate 'line', 8251
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8253
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8254
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8256
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 8257
    new $P7, [ 'TokenQuoted' ]
    getattribute $P8, $P1, 'file'
    getattribute $P9, $P1, 'line'
# predefined join
    join $S1, '.', $P3
    $P7.'TokenQuoted'($P8, $P9, $S1)
    set $P6, $P7
    $P5.'StringLiteral'(self, $P6)
    set $P4, $P5
.annotate 'line', 8255
    self.'createconst'('__FUNCTION__', 'S', $P4, '')
.annotate 'line', 8260
    $P2 = __ARG_1.'get'()
.annotate 'line', 8261
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8262
    'ExpectedOp'('{', $P2)
 __label_1: # endif
.annotate 'line', 8263
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8264
    .return(self)
# }
.annotate 'line', 8265

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8209
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8211
    addattribute $P0, 'paramnum'
.annotate 'line', 8212
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8276
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8277
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8278
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8279
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8280
    setattribute self, 'name', $P1
.annotate 'line', 8281
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8282
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8283
    'RequireOp'('{', $P2)
.annotate 'line', 8284
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8285
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8286

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8287
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8288
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8291
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8292

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8296
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8297

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8301
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8302

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8305
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8306
    unless_null $P1, __label_0
# {
.annotate 'line', 8309
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8310
    unless_null $P1, __label_1
# {
.annotate 'line', 8312
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8313
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8314
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8315
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
 __label_5:
.annotate 'line', 8316
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8317
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 8318
    self.'setusedlex'($S1, $S2)
# }
 __label_4: # endif
# }
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 8322
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
 __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8323
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8324
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8325
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8326
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_9
# {
.annotate 'line', 8327
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8328
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
 __label_11:
.annotate 'line', 8329
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8330
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8331
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8332
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 8333
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
.annotate 'line', 8338
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
 __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8339
    'InternalError'('Incorrect data for variable in LocalFunction')
 __label_13: # endif
.annotate 'line', 8340
    .return($P1)
# }
.annotate 'line', 8341

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8272
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8352
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8353

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8354
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8348
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
# Body
# {
.annotate 'line', 8371
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8372

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8373
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8377
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8378

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8367
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8386
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8387
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8388

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8389
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8393
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 8394
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8395

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8381
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8383
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8404
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8405
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8406
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8407
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8408
    'Expected'('literal string', $P2)
 __label_0: # endif
.annotate 'line', 8409
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8410
    $P2 = __ARG_1.'get'()
.annotate 'line', 8411
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8412
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 8414
    box $P5, 1
    setattribute self, 'hll', $P5
 __label_5: # case
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 8418
    'SyntaxError'('Unexpected token in class key', $P2)
 __label_2: # switch end
 __label_6: # do
.annotate 'line', 8420
# {
.annotate 'line', 8421
    $P2 = __ARG_1.'get'()
.annotate 'line', 8422
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8423
    'Expected'('literal string', $P2)
 __label_9: # endif
.annotate 'line', 8424
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
 __label_8: # continue
.annotate 'line', 8425
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
 __label_7: # enddo
.annotate 'line', 8426
    'RequireOp'(']', $P2)
# }
 __label_1: # endif
.annotate 'line', 8428
    setattribute self, 'key', $P1
# }
.annotate 'line', 8429

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8430
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8433
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8434

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8438
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8439

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8398
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8400
    addattribute $P0, 'key'
.annotate 'line', 8401
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8447
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8448
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8449
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 8450
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8451
    $P2 = __ARG_1.'get'()
.annotate 'line', 8452
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 8454
    __ARG_1.'unget'($P2)
.annotate 'line', 8455
    setattribute self, 'key', $P1
# }
.annotate 'line', 8456

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8457
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8461
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8462
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8463

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8467
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8468
    unless_null $P1, __label_0
# {
.annotate 'line', 8469
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8470
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
 __label_2: # endif
.annotate 'line', 8471
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 8473
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
 __label_1: # endif
# }
.annotate 'line', 8474

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8442
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8444
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8479
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8480
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8481
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_0: # endif
.annotate 'line', 8482
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8483
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_1: # endif
.annotate 'line', 8484
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8485
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_2: # endif
.annotate 'line', 8486
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8487

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8505
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8506
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8507
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8508
    setattribute self, 'functions', $P1
.annotate 'line', 8509
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8510
    setattribute self, 'members', $P2
.annotate 'line', 8511
    root_new $P13, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P13
.annotate 'line', 8512
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8513
    setattribute self, 'constants', $P3
.annotate 'line', 8515
# var name: $P4
    $P4 = __ARG_2.'get'()
.annotate 'line', 8516
    setattribute self, 'name', $P4
.annotate 'line', 8517
# var classns: $P5
    $P12 = __ARG_3.'getpath'()
# predefined clone
    clone $P5, $P12
.annotate 'line', 8518
    getattribute $P12, self, 'name'
# predefined push
    push $P5, $P12
.annotate 'line', 8519
    setattribute self, 'classns', $P5
.annotate 'line', 8521
# var t: $P6
    $P6 = __ARG_2.'get'()
.annotate 'line', 8522
    $P12 = $P6.'isop'(':')
    if_null $P12, __label_0
    unless $P12 goto __label_0
# {
.annotate 'line', 8523
# var bases: $P7
    getattribute $P7, self, 'bases'
 __label_2: # Infinite loop
.annotate 'line', 8524
# {
.annotate 'line', 8525
# var base: $P8
    $P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8526
# predefined push
    push $P7, $P8
.annotate 'line', 8527
    $P6 = __ARG_2.'get'()
.annotate 'line', 8528
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
.annotate 'line', 8531
    'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8532
    $P6 = __ARG_2.'get'()
 __label_6: # for condition
    $P12 = $P6.'isop'('}')
    isfalse $I1, $P12
    unless $I1 goto __label_5
# {
.annotate 'line', 8533
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
.annotate 'line', 8535
# var f: $P9
    new $P9, [ 'MethodStatement' ]
    $P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8536
# predefined push
    push $P1, $P9
    goto __label_7 # break
 __label_10: # case
.annotate 'line', 8539
# var name: $P10
    $P10 = __ARG_2.'get'()
.annotate 'line', 8540
    $P14 = $P10.'isidentifier'()
    isfalse $I2, $P14
    unless $I2 goto __label_12
.annotate 'line', 8541
    'Expected'("member identifier", $P10)
 __label_12: # endif
.annotate 'line', 8542
# predefined push
    push $P2, $P10
.annotate 'line', 8543
    $P6 = __ARG_2.'get'()
.annotate 'line', 8544
    $P15 = $P6.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_13
.annotate 'line', 8545
    'Expected'("';' in member declaration", $P6)
 __label_13: # endif
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 8548
# var cst: $P11
    $P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8549
# predefined push
    push $P3, $P11
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 8552
    'SyntaxError'("Unexpected item in class", $P6)
 __label_7: # switch end
# }
 __label_4: # for iteration
.annotate 'line', 8532
    $P6 = __ARG_2.'get'()
    goto __label_6
 __label_5: # for end
# }
.annotate 'line', 8555

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8558
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8559

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8562
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8563

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8566
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8567

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8570
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8571

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8574
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8575

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8578
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8579

.end # use_predef


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8582
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8583
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8584
    .return(self)
# }
.annotate 'line', 8585

.end # optimize


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8588
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8589

.end # getclasskey


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8592
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8593
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8594
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8595
    $P2.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8597
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8599
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8600
# n: $I1
    set $I1, 1
.annotate 'line', 8601
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8602
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8603
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8604
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8605
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8606
    __ARG_1.'say'()
.annotate 'line', 8607
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8609
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
 __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8610
    __ARG_1.'annotate'($P4)
.annotate 'line', 8611
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 8614
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8615

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8493
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8495
    addattribute $P0, 'parent'
.annotate 'line', 8496
    addattribute $P0, 'name'
.annotate 'line', 8497
    addattribute $P0, 'bases'
.annotate 'line', 8498
    addattribute $P0, 'constants'
.annotate 'line', 8499
    addattribute $P0, 'functions'
.annotate 'line', 8500
    addattribute $P0, 'members'
.annotate 'line', 8501
    addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8624
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8625
    $P6 = $P1.'isstring'()
    isfalse $I4, $P6
    unless $I4 goto __label_0
.annotate 'line', 8626
    'Expected'('literal string', $P1)
 __label_0: # endif
.annotate 'line', 8627
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8628
# filename: $S1
    $P6 = $P1.'rawstring'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
 __label_1:
.annotate 'line', 8629
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8634
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8635
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8636
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8637
    iter $P7, $P4
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $S2, $P7
# {
.annotate 'line', 8638
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8639
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_4
    push_eh $P6
# try: begin
# {
.annotate 'line', 8640
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8641
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8639
# catch
 __label_4:
    .get_results($P8)
    finalize $P8
    pop_eh
# catch end
 __label_5:
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8646
    $P6 = $P5.'is_closed'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 8647
    'SyntaxError'('File not found', $P1)
 __label_6: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 8652
# line: $S4
    $P6 = $P5.'readline'()
    null $S4
    if_null $P6, __label_10
    set $S4, $P6
 __label_10:
 __label_9: # for condition
    $P8 = $P5.'eof'()
    isfalse $I4, $P8
    unless $I4 goto __label_8
# {
.annotate 'line', 8653
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_11
# {
.annotate 'line', 8654
# pos: $I1
    set $I1, 12
.annotate 'line', 8655
# c: $S5
    null $S5
 __label_13: # while
.annotate 'line', 8656
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_14
    iseq $I4, $S5, "\t"
 __label_14:
    unless $I4 goto __label_12
.annotate 'line', 8657
    inc $I1
    goto __label_13
 __label_12: # endwhile
.annotate 'line', 8658
# pos2: $I2
    set $I2, $I1
 __label_16: # while
.annotate 'line', 8659
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_20
    isne $I4, $S5, "\t"
 __label_20:
    unless $I4 goto __label_19
.annotate 'line', 8660
    isne $I4, $S5, "\n"
 __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, "\r"
 __label_18:
    unless $I4 goto __label_17
    isne $I4, $S5, ""
 __label_17:
    unless $I4 goto __label_15
.annotate 'line', 8661
    inc $I2
    goto __label_16
 __label_15: # endwhile
.annotate 'line', 8662
    ne $I2, $I1, __label_21
    goto __label_7 # continue
 __label_21: # endif
.annotate 'line', 8664
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
 __label_23: # while
.annotate 'line', 8665
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_24
    iseq $I4, $S5, "\t"
 __label_24:
    unless $I4 goto __label_22
.annotate 'line', 8666
    inc $I2
    goto __label_23
 __label_22: # endwhile
.annotate 'line', 8667
    set $I1, $I2
 __label_26: # while
.annotate 'line', 8668
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_30
    isne $I4, $S5, "\t"
 __label_30:
    unless $I4 goto __label_29
.annotate 'line', 8669
    isne $I4, $S5, "\n"
 __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, "\r"
 __label_28:
    unless $I4 goto __label_27
    isne $I4, $S5, ""
 __label_27:
    unless $I4 goto __label_25
.annotate 'line', 8670
    inc $I2
    goto __label_26
 __label_25: # endwhile
.annotate 'line', 8671
    ne $I2, $I1, __label_31
    goto __label_7 # continue
 __label_31: # endif
.annotate 'line', 8673
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 8675
# ivalue: $I3
    null $I3
.annotate 'line', 8676
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_34
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
 __label_34:
    unless $I4 goto __label_32
.annotate 'line', 8677
# predefined substr
    substr $S10, $S7, 2
    box $P8, $S10
    $P6 = $P8.'to_int'(16)
    set $I3, $P6
    goto __label_33
 __label_32: # else
.annotate 'line', 8679
    set $I3, $S7
 __label_33: # endif
.annotate 'line', 8682
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, __ARG_1, 'file'
    getattribute $P11, __ARG_1, 'line'
    $P9.'TokenInteger'($P10, $P11, $S6)
    set $P8, $P9
.annotate 'line', 8681
    $P6 = 'integerValue'(__ARG_3, $P8, $I3)
.annotate 'line', 8680
    __ARG_3.'createconst'($S6, 'I', $P6, '', 4)
# }
 __label_11: # endif
# }
 __label_7: # for iteration
.annotate 'line', 8652
    $P6 = $P5.'readline'()
    set $S4, $P6
    goto __label_9
 __label_8: # for end
.annotate 'line', 8687
    $P5.'close'()
# }
.annotate 'line', 8688

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8703
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 8704
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8705
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8706
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8707
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8708

.end # NamespaceBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8711
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8712

.end # getpath


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8715
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8716
    iter $P3, $P1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8717
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 8718
    .return($P2)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P4
.annotate 'line', 8719
    .return($P4)
# }
.annotate 'line', 8720

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8725
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
.annotate 'line', 8727
    .return($P5)
 __label_3: # case
.annotate 'line', 8730
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
 __label_1: # default
.annotate 'line', 8735
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 8736
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 8737
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 8738
    iter $P8, $P1
    set $P8, 0
 __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 8739
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 8740
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8741
    if_null $P4, __label_8
.annotate 'line', 8742
    .return($P4)
 __label_8: # endif
# }
 __label_7: # endif
# }
    goto __label_5
 __label_6: # endfor
 __label_0: # switch end
    null $P5
.annotate 'line', 8746
    .return($P5)
# }
.annotate 'line', 8747

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8752
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
.annotate 'line', 8754
    .return($P7)
 __label_3: # case
.annotate 'line', 8756
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 8758
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 8759
    if_null $P1, __label_4
.annotate 'line', 8760
    .return($P1)
 __label_4: # endif
.annotate 'line', 8761
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
 __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 8762
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 8763
    .return($P2)
 __label_7: # endif
    goto __label_5
 __label_6: # endfor
    null $P11
.annotate 'line', 8764
    .return($P11)
 __label_1: # default
.annotate 'line', 8769
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 8770
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 8771
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
 __label_8:
.annotate 'line', 8772
    iter $P13, $P3
    set $P13, 0
 __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 8773
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 8774
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8775
    if_null $P6, __label_12
.annotate 'line', 8776
    .return($P6)
 __label_12: # endif
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
 __label_0: # switch end
    null $P7
.annotate 'line', 8780
    .return($P7)
# }
.annotate 'line', 8781

.end # findsymbol


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8784
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8785
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 8786
    $P1 = __ARG_2.'get'()
.annotate 'line', 8788
# var modifier: $P2
    null $P2
.annotate 'line', 8789
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8790
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 8791
    $P1 = __ARG_2.'get'()
# }
 __label_1: # endif
.annotate 'line', 8794
    'RequireOp'('{', $P1)
.annotate 'line', 8795
# var child: $P3
    new $P3, [ 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8796
    getattribute $P4, self, 'namespaces'
# predefined push
    push $P4, $P3
.annotate 'line', 8797
    getattribute $P4, self, 'items'
# predefined push
    push $P4, $P3
.annotate 'line', 8798
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 8799

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8802
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 8803
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 8804
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 8805
# var t: $P4
    null $P4
# for loop
.annotate 'line', 8806
    $P4 = __ARG_1.'get'()
 __label_2: # for condition
    set $I1, $P4
    unless $I1 goto __label_3
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 8808
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
.annotate 'line', 8810
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 8813
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8814
# predefined push
    push $P1, $P5
    goto __label_4 # break
 __label_8: # case
.annotate 'line', 8817
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8818
# predefined push
    push $P2, $P6
.annotate 'line', 8819
# predefined push
    push $P1, $P6
    goto __label_4 # break
 __label_9: # case
.annotate 'line', 8822
# var c: $P7
    new $P7, [ 'ClassStatement' ]
    $P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8823
# predefined push
    push $P3, $P7
.annotate 'line', 8824
# predefined push
    push $P1, $P7
    goto __label_4 # break
 __label_10: # case
.annotate 'line', 8827
    $P4 = __ARG_1.'get'()
.annotate 'line', 8828
    $P10 = $P4.'iskeyword'('extern')
    isfalse $I2, $P10
    unless $I2 goto __label_14
.annotate 'line', 8829
    'SyntaxError'('Unsupported at namespace level', $P4)
 __label_14: # endif
.annotate 'line', 8830
    $P4 = __ARG_1.'get'()
.annotate 'line', 8831
    $P11 = $P4.'isstring'()
    isfalse $I3, $P11
    unless $I3 goto __label_15
.annotate 'line', 8832
    'Expected'('string literal', $P4)
 __label_15: # endif
.annotate 'line', 8833
# reqlib: $S1
    set $P12, $P4
    null $S1
    if_null $P12, __label_16
    set $S1, $P12
 __label_16:
.annotate 'line', 8834
    self.'addlib'($S1)
.annotate 'line', 8835
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
 __label_11: # case
.annotate 'line', 8838
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_12: # case
.annotate 'line', 8841
    $P4 = __ARG_1.'get'()
.annotate 'line', 8842
    $P13 = $P4.'isstring'()
    isfalse $I4, $P13
    unless $I4 goto __label_17
.annotate 'line', 8843
    'Expected'('string literal', $P4)
 __label_17: # endif
.annotate 'line', 8844
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8845
    new $P16, [ 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P4)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_4 # break
 __label_13: # case
.annotate 'line', 8848
    $P4 = __ARG_1.'get'()
.annotate 'line', 8849
    $P17 = $P4.'isstring'()
    isfalse $I5, $P17
    unless $I5 goto __label_18
.annotate 'line', 8850
    'Expected'('string literal', $P4)
 __label_18: # endif
.annotate 'line', 8851
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8852
    new $P20, [ 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P4)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 8855
    'SyntaxError'("Unexpected token", $P4)
 __label_4: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 8806
    $P4 = __ARG_1.'get'()
    goto __label_2
 __label_1: # for end
.annotate 'line', 8858
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 8859
    self.'close_ns'($P4)
    goto __label_20
 __label_19: # else
.annotate 'line', 8861
    self.'unclosed_ns'()
 __label_20: # endif
# }
.annotate 'line', 8862

.end # parse


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 8865
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 8866

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8869
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 8870
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 8872
# activate: $I1
    set $I1, 1
.annotate 'line', 8873
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
 __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8874
    isa $I2, $P2, [ 'NamespaceStatement' ]
    if $I2 goto __label_5
.annotate 'line', 8875
    isa $I2, $P2, [ 'ClassStatement' ]
 __label_5:
    unless $I2 goto __label_3
.annotate 'line', 8876
    set $I1, 1
    goto __label_4
 __label_3: # else
.annotate 'line', 8878
    unless $I1 goto __label_6
# {
.annotate 'line', 8879
    __ARG_1.'say'($S1)
.annotate 'line', 8880
    null $I1
# }
 __label_6: # endif
 __label_4: # endif
.annotate 'line', 8882
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 8884

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8692
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8694
    addattribute $P0, 'nspath'
.annotate 'line', 8695
    addattribute $P0, 'namespaces'
.annotate 'line', 8696
    addattribute $P0, 'classes'
.annotate 'line', 8697
    addattribute $P0, 'functions'
.annotate 'line', 8698
    addattribute $P0, 'items'
.annotate 'line', 8699
    addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8902
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8903
# predefined push
    push $P1, __ARG_3
.annotate 'line', 8904
    self.'NamespaceBase'($P1)
.annotate 'line', 8906
    setattribute self, 'parent', __ARG_1
.annotate 'line', 8907
    setattribute self, 'start', __ARG_2
.annotate 'line', 8908
    setattribute self, 'owner', __ARG_1
.annotate 'line', 8909
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 8910
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 8911
    if_null __ARG_4, __label_0
# {
.annotate 'line', 8912
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 8913
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
 __label_1: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8915

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 8918
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8919

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8922
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8923

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8926
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8927

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8930
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8931

.end # addlib


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8934
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 8935

.end # addlib


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8938
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8939
    unless_null $P1, __label_0
.annotate 'line', 8940
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 8942
    .return($P1)
 __label_1: # endif
# }
.annotate 'line', 8943

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8948
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8949
    unless_null $P1, __label_0
.annotate 'line', 8950
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
 __label_0: # endif
.annotate 'line', 8951
    .return($P1)
# }
.annotate 'line', 8952

.end # findclasskey


.sub 'unclosed_ns' :method
# Body
# {
.annotate 'line', 8955
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8956

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8963
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 8964
    if_null $P1, __label_0
# {
.annotate 'line', 8965
    $P1 = $P1.'optimize'()
.annotate 'line', 8966
    setattribute self, 'modifier', $P1
# }
 __label_0: # endif
.annotate 'line', 8968
    self.'optimize_base'()
.annotate 'line', 8969
    .return(self)
# }
.annotate 'line', 8970

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8973
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 8974
    if_null $P1, __label_0
.annotate 'line', 8975
    __ARG_1.'say'(".HLL '", $P1, "'")
 __label_0: # endif
.annotate 'line', 8977
    self.'emit_base'(__ARG_1)
.annotate 'line', 8979
    if_null $P1, __label_1
.annotate 'line', 8980
    __ARG_1.'say'(".HLL 'parrot'")
 __label_1: # endif
# }
.annotate 'line', 8981

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8891
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8893
    addattribute $P0, 'parent'
.annotate 'line', 8894
    addattribute $P0, 'start'
.annotate 'line', 8895
    addattribute $P0, 'name'
.annotate 'line', 8896
    addattribute $P0, 'modifier'
.annotate 'line', 8897
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8998
    new $P1, ['ResizableStringArray']
.annotate 'line', 8999
    self.'NamespaceBase'($P1)
.annotate 'line', 9000
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9001
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9002
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9003

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9006
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9007
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9008

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9011
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9012
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
 __label_1:
    set $I1, 1
 __label_0:
    .return($I1)
# }
.annotate 'line', 9013

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9017
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 9018
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 9019
    inc $I1
.annotate 'line', 9020
    assign $P1, $I1
.annotate 'line', 9021
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 9022
    .return($S1)
# }
.annotate 'line', 9023

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9027
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9028
    unless_null $P1, __label_0
# {
.annotate 'line', 9029
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9030
    setattribute self, 'libs', $P1
# }
 __label_0: # endif
.annotate 'line', 9032
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9033

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9036
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9037
    unless_null $P1, __label_0
# {
.annotate 'line', 9038
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9039
    setattribute self, 'loads', $P1
# }
 __label_0: # endif
.annotate 'line', 9041
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9042

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9045
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9046

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9050
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 9051

.end # findclasskey


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9058
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9059

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9062
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9063

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9066
    self.'optimize_base'()
.annotate 'line', 9067
    .return(self)
# }
.annotate 'line', 9068

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9071
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9074
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 9075
    self.'addload'('"String/Utils.pbc"')
 __label_0: # endif
.annotate 'line', 9078
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
.annotate 'line', 9081
    iter $P6, $P2
    set $P6, 0
 __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 9082
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 9083
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 9084
# }
 __label_3: # endif
    goto __label_1
 __label_2: # endfor
.annotate 'line', 9087
# somelib: $I1
    null $I1
.annotate 'line', 9088
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9089
    if_null $P3, __label_4
# {
.annotate 'line', 9090
    set $I1, 1
.annotate 'line', 9091
    iter $P7, $P3
    set $P7, 0
 __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 9092
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
 __label_6: # endfor
# }
 __label_4: # endif
.annotate 'line', 9095
# someload: $I2
    null $I2
.annotate 'line', 9096
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9097
    if_null $P4, __label_7
# {
.annotate 'line', 9098
    set $I2, 1
.annotate 'line', 9099
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9100
    iter $P8, $P4
    set $P8, 0
 __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 9101
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
 __label_9: # endfor
.annotate 'line', 9102
    __ARG_1.'print'(".end\n\n")
# }
 __label_7: # endif
.annotate 'line', 9104
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 9105
    __ARG_1.'comment'('end libs')
 __label_10: # endif
.annotate 'line', 9107
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9108

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9111
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9112
    iter $P4, $P1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $S1, $P4
# {
.annotate 'line', 9113
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9114
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_4
.annotate 'line', 9115
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
 __label_4:
    if $I1 goto __label_3
.annotate 'line', 9116
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
 __label_3:
    unless $I1 goto __label_2
    goto __label_0 # continue
 __label_2: # endif
.annotate 'line', 9118
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9119
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 9121

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8988
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8990
    addattribute $P0, 'unit'
.annotate 'line', 8991
    addattribute $P0, 'predefs_used'
.annotate 'line', 8992
    addattribute $P0, 'libs'
.annotate 'line', 8993
    addattribute $P0, 'loads'
.annotate 'line', 8994
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9137
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 9138
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9141
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9145
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9144
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 9143
    $P1.'createconst'('false', 'I', $P3, '', 4)
.annotate 'line', 9149
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9148
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 9147
    $P1.'createconst'('true', 'I', $P3, '', 4)
.annotate 'line', 9155
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 9156
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
.annotate 'line', 9154
    $P1.'createconst'('__STAGE__', 'S', $P3, '', 4)
.annotate 'line', 9159
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9160

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9163
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9164

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9167
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9168

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9171
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 9172

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9175
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9176

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9179
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9180
    __ARG_1.'say'('')
.annotate 'line', 9182
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9184
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9185

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9188
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9189
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9191
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9193
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9194

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9132
    addattribute $P0, 'rootns'
.annotate 'line', 9133
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9203
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 9204
    .return(__ARG_1)
 __label_0: # endif
.annotate 'line', 9205
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9206
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9207
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9208
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 9209
    $P2.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9210
    __ARG_1.'emit'($P2)
.annotate 'line', 9211
    $P2.'close'()
.annotate 'line', 9212
    $P1.'close'()
.annotate 'line', 9213
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 9214
# var object: $P3
    null $P3
.annotate 'line', 9215
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
.annotate 'line', 9217
    new $P3, [ 'String' ]
.annotate 'line', 9218
    assign $P3, $S1
    goto __label_3 # break
 __label_6: # case
 __label_7: # case
.annotate 'line', 9222
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9223
    $P3 = $P4($S1)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 9224
# predefined die
.annotate 'line', 9226
    die 'Invalid target'
 __label_3: # switch end
.annotate 'line', 9228
    .return($P3)
# }
.annotate 'line', 9229

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9232
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9233
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9234
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9235
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9236
    $P2.'close'()
.annotate 'line', 9237
    $P1.'close'()
.annotate 'line', 9238
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9239

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9245
    unless_null __ARG_2, __label_0
.annotate 'line', 9246
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9247
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9248
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9249
    $P1.'puts'(__ARG_1)
.annotate 'line', 9250
    $P1.'close'()
.annotate 'line', 9251
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9252
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9253
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9254
    unless __ARG_4 goto __label_1
.annotate 'line', 9255
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9256
    $P3.'parse'($P2)
.annotate 'line', 9257
    $P1.'close'()
.annotate 'line', 9258
    $P3.'optimize'()
.annotate 'line', 9259
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9260

.end # compile


.sub 'compile_from_file_to_pir' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9265
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9266
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9267
    $P1.'encoding'('utf8')
.annotate 'line', 9268
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9269
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9270
    unless __ARG_4 goto __label_0
.annotate 'line', 9271
    $P3.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9272
    $P3.'parse'($P2)
.annotate 'line', 9273
    $P1.'close'()
.annotate 'line', 9274
    $P3.'optimize'()
.annotate 'line', 9275
# var emit: $P4
    new $P4, [ 'Emit' ]
    $P4.'Emit'(__ARG_2)
.annotate 'line', 9276
    unless __ARG_3 goto __label_1
.annotate 'line', 9277
    $P4.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9278
    $P3.'emit'($P4)
.annotate 'line', 9279
    $P4.'close'()
# }
.annotate 'line', 9280

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9286
    unless_null __ARG_2, __label_0
.annotate 'line', 9287
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9288
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9289
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9290
    $P1.'encoding'('utf8')
.annotate 'line', 9291
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9292
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9293
    unless __ARG_4 goto __label_1
.annotate 'line', 9294
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9295
    $P3.'parse'($P2)
.annotate 'line', 9296
    $P1.'close'()
.annotate 'line', 9297
    $P3.'optimize'()
.annotate 'line', 9298
    ne __ARG_2, 'include', __label_2
# {
.annotate 'line', 9299
    .tailcall self.'__private_geninclude'($P3)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 9302
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
 __label_3: # endif
# }
.annotate 'line', 9303

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
        .param int __ARG_5
# Body
# {
.annotate 'line', 9311
# var winxed: $P1
    new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9312
    not $I1, __ARG_3
    unless $I1 goto __label_0
.annotate 'line', 9313
    $P1.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9314
    $P1.'parse'(__ARG_1)
.annotate 'line', 9316
    $P1.'optimize'()
.annotate 'line', 9318
# var handle: $P2
    null $P2
.annotate 'line', 9319
    ne __ARG_2, '-', __label_1
.annotate 'line', 9320
# predefined getstdout
    getstdout $P2
    goto __label_2
 __label_1: # else
.annotate 'line', 9322
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'(__ARG_2,'w')
 __label_2: # endif
.annotate 'line', 9323
# var emit: $P3
    new $P3, [ 'Emit' ]
    $P3.'Emit'($P2)
.annotate 'line', 9324
    unless __ARG_4 goto __label_3
.annotate 'line', 9325
    $P3.'disable_annotations'()
 __label_3: # endif
.annotate 'line', 9326
    unless __ARG_5 goto __label_4
.annotate 'line', 9327
    $P1.'emitinclude'($P3)
    goto __label_5
 __label_4: # else
.annotate 'line', 9329
    $P1.'emit'($P3)
 __label_5: # endif
.annotate 'line', 9330
    $P3.'close'()
.annotate 'line', 9331
    $P2.'close'()
# }
.annotate 'line', 9332

.end # winxed_parser


.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9340
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9341
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9342

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9351
    load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9352
# var getopts: $P1
    new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9353
    $P1.'notOptStop'(1)
.annotate 'line', 9354
    $P1.'push_string'('o=s')
.annotate 'line', 9355
    $P1.'push_string'('e=s')
.annotate 'line', 9356
    $P1.'push_string'('geninclude')
.annotate 'line', 9357
    $P1.'push_string'('noan')
.annotate 'line', 9358
    $P1.'push_string'('nowarn')
.annotate 'line', 9359
    $P1.'notOptStop'(1)
.annotate 'line', 9360
    __ARG_1.'shift'()
.annotate 'line', 9361
# var opts: $P2
    $P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9362
    setattribute self, 'getopts', $P1
.annotate 'line', 9363
    setattribute self, 'opts', $P2
# }
.annotate 'line', 9364

.end # Options


.sub 'getbool' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9367
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9368
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9369
    isnull $I1, $P2
    not $I1
    .return($I1)
# }
.annotate 'line', 9370

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 9373
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9374
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9375
    if_null $P2, __label_1
# predefined string
    set $S1, $P2
    goto __label_0
 __label_1:
    set $S1, __ARG_2
 __label_0:
    .return($S1)
# }
.annotate 'line', 9376

.end # getstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Options' ]
.annotate 'line', 9346
    addattribute $P0, 'getopts'
.annotate 'line', 9347
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9381
# var options: $P1
    new $P1, [ 'Options' ]
    $P1.'Options'(__ARG_1)
.annotate 'line', 9382
# outputfile: $S1
    $P4 = $P1.'getstring'('o', '')
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9383
# expr: $S2
    $P4 = $P1.'getstring'('e')
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 9384
# noan: $I1
    $P4 = $P1.'getbool'('noan')
    set $I1, $P4
.annotate 'line', 9385
# warn: $I2
    $P4 = $P1.'getbool'('nowarn')
    isfalse $I2, $P4
.annotate 'line', 9386
# geninclude: $I3
    $P4 = $P1.'getbool'('geninclude')
    set $I3, $P4
.annotate 'line', 9388
# argc: $I4
    set $P4, __ARG_1
    set $I4, $P4
.annotate 'line', 9389
# filename: $S3
    null $S3
.annotate 'line', 9390
# var file: $P2
    null $P2
.annotate 'line', 9391
    unless_null $S2, __label_2
# {
.annotate 'line', 9392
    ne $I4, 0, __label_4
# predefined Error
.annotate 'line', 9393
    root_new $P4, ['parrot';'Exception']
    $P4['message'] = 'No file'
    throw $P4
 __label_4: # endif
.annotate 'line', 9395
    $S3 = __ARG_1[0]
.annotate 'line', 9396
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'($S3)
.annotate 'line', 9397
    $P2.'encoding'('utf8')
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 9400
    concat $S0, 'function main[main](argv){', $S2
    concat $S0, $S0, ';}'
    set $S2, $S0
.annotate 'line', 9401
    new $P2, [ 'StringHandle' ]
.annotate 'line', 9402
    $P2.'open'('__eval__', 'w')
.annotate 'line', 9403
    $P2.'puts'($S2)
.annotate 'line', 9404
    $P2.'close'()
.annotate 'line', 9405
    $P2.'open'('__eval__')
.annotate 'line', 9406
    set $S3, '__eval__'
# }
 __label_3: # endif
.annotate 'line', 9409
# var t: $P3
    new $P3, [ 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9411
    'winxed_parser'($P3, $S1, $I2, $I1, $I3)
.annotate 'line', 9413
    $P2.'close'()
# }
.annotate 'line', 9414

.end # stage1


.sub 'show_backtrace'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9418
# i: $I1
    set $I1, 1
.annotate 'line', 9419
    iter $P4, __ARG_1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 9420
# var sub: $P2
    $P2 = $P1['sub']
.annotate 'line', 9421
# subname: $S1
    null $S1
.annotate 'line', 9422
    if_null $P2, __label_2
# {
.annotate 'line', 9423
    set $S1, $P2
.annotate 'line', 9424
# ns: $S2
    $P5 = $P2.'get_namespace'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 9425
    isne $I3, $S2, ''
    unless $I3 goto __label_5
    isne $I3, $S2, 'parrot'
 __label_5:
    unless $I3 goto __label_4
.annotate 'line', 9426
    concat $S0, $S2, '.'
    concat $S0, $S0, $S1
    set $S1, $S0
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 9428
# var ann: $P3
    $P3 = $P1['annotations']
.annotate 'line', 9429
# file: $S3
    $S3 = $P3['file']
.annotate 'line', 9430
    eq $S3, '', __label_6
# {
.annotate 'line', 9431
# line: $I2
    $I2 = $P3['line']
.annotate 'line', 9432
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
.annotate 'line', 9435

.end # show_backtrace


.sub 'main' :main
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9439
# retval: $I1
    null $I1
.annotate 'line', 9440
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_0
    $P2.'min_severity'(2)
    $P2.'max_severity'(2)
    $P2.'handle_types'(555, 556, 557)
    push_eh $P2
# try: begin
.annotate 'line', 9446
    'stage1'(__ARG_1)
# try: end
    pop_eh
    goto __label_1
.annotate 'line', 9440
# catch
 __label_0:
    .get_results($P1)
    finalize $P1
    pop_eh
# {
.annotate 'line', 9449
# msg: $S1
    $S1 = $P1['message']
.annotate 'line', 9450
# type: $I2
    $I2 = $P1['type']
.annotate 'line', 9451
    set $I3, $I2
    set $I4, 556
    if $I3 == $I4 goto __label_4
    set $I4, 557
    if $I3 == $I4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 9454
# predefined cry
    getstderr $P0
    print $P0, 'Error: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9455
    set $I1, 1
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 9458
# predefined cry
    getstderr $P0
    print $P0, 'INTERNAL ERROR: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9459
    $P2 = $P1.'backtrace'()
    'show_backtrace'($P2)
.annotate 'line', 9460
    set $I1, 2
 __label_2: # switch end
# }
# catch end
 __label_1:
.annotate 'line', 9463
# predefined exit
    exit $I1
# }
.annotate 'line', 9464

.end # main

# End generated code
