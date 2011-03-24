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
# Body
# {
.annotate 'line', 573
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 574

.end # ungetchar


.sub 'get_token' :method
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
# Body
# {
.annotate 'line', 694
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 695

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 698
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 699

.end # close


.sub 'updateannot' :method
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
# Body
# {
.annotate 'line', 772
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 773
    $P1.'print'('    goto ')
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
# Body
# {
.annotate 'line', 796
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 797

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 800
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 801

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 804
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 805

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 808
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 809

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 813
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 814

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 817
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 818

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
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
# Body
# {
.annotate 'line', 873
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 874

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 877
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 878

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 881
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 882

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
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
# Body
# {
.annotate 'line', 1035
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1036

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1037
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
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
    isa $I1, $P1, [ 'IndexExpr' ]
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
# Body
# {
.annotate 'line', 1153
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1154
    isa $I2, $P1, [ 'CallExpr' ]
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
# Body
# {
.annotate 'line', 1622
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1623

.end # use_predef


.sub 'generatesubid' :method
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
# Body
# {
.annotate 'line', 1638
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1639

.end # findclasskey


.sub 'dowarnings' :method
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
# Body
# {
.annotate 'line', 1658
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'args', $P2
# }
.annotate 'line', 1659

.end # init


.sub 'numargs' :method
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
# Body
# {
.annotate 'line', 1714
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
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
# Body
# {
.annotate 'line', 1767
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
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
# Body
# {
.annotate 'line', 1887
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1888

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1889
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
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
# Body
# {
.annotate 'line', 1896
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1897

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1900
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1901

.end # freetemps


.sub 'genlabel' :method
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
# Body
# {
.annotate 'line', 1928
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1929

.end # checkclass


.sub 'getouter' :method
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
# Body
# {
.annotate 'line', 1944
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1945

.end # getbreaklabel


.sub 'optimize' :method
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
# Body
# {
.annotate 'line', 1956
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1959
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 1960

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1961
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
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
# Body
# {
.annotate 'line', 1997
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
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
# Body
# {
.annotate 'line', 2012
    unless_null __ARG_1, __label_0
.annotate 'line', 2013
    .return(__ARG_2)
    goto __label_1
 __label_0: # else
.annotate 'line', 2014
    isa $I1, __ARG_1, [ 'MultiStatement' ]
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
# Body
# {
.annotate 'line', 2107
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
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
# Body
# {
.annotate 'line', 2129
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
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
    isa $I1, $P3, [ 'FunctionStatement' ]
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
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
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
# Body
# {
.annotate 'line', 2247
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2248

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2249
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2250
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2251
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2252
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2253
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
# Body
# {
.annotate 'line', 2254
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2255
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2256
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
# Body
# {
.annotate 'line', 2264
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2265

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
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
    isa $I2, $P2, [ 'VarData' ]
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
# Body
# {
.annotate 'line', 2364
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2365

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2366
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2367
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2368
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2369
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2370
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2371
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2372
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2373
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2374
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2377
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2378

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2382
    .return(self)
# }
.annotate 'line', 2383

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2384
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
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
# Body
# {
.annotate 'line', 2411
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
# Body
# {
.annotate 'line', 2427
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
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
# Body
# {
.annotate 'line', 2485
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2487
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2488
    isa $I1, $P1, [ 'NullCheckerExpr' ]
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
# Body
# {
.annotate 'line', 2508
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2510
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2511
    isa $I1, $P1, [ 'NullCheckerExpr' ]
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
# Body
# {
.annotate 'line', 2535
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2536
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
# Body
# {
.annotate 'line', 2549
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2550
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
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
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
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
    isa $I1, $P1, [ 'TokenQuoted' ]
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
# Body
# {
.annotate 'line', 2635
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2636
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
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
# Body
# {
.annotate 'line', 2669
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2670
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
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
# Body
# {
.annotate 'line', 2701
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
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
# Body
# {
.annotate 'line', 2709
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2710

.end # isnull


.sub 'checkresult' :method
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
    isa $I1, __ARG_2, [ 'IndexExpr' ]
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
# Body
# {
.annotate 'line', 2858
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
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
    isa $I1, __ARG_2, [ 'IndexExpr' ]
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
# Body
# {
.annotate 'line', 2921
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
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
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
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
# Body
# {
.annotate 'line', 3005
    .return('I')
# }
.annotate 'line', 3006

.end # checkresult


.sub 'optimize' :method
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
# Body
# {
.annotate 'line', 3041
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3042
    isa $I1, $P1, [ 'IndexExpr' ]
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
    __ARG_1.'print'('    delete ')
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
    isa $I1, $P1, [ 'IndexExpr' ]
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
    __ARG_1.'print'('    exists ', $S1, ', ')
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
    isa $I1, $P1, [ 'IndexExpr' ]
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
    __ARG_1.'print'('    exists ', $S1, ', ')
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
# Body
# {
.annotate 'line', 3131
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
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
# Body
# {
.annotate 'line', 3296
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3297

.end # checkresult


.sub 'optimize_base' :method
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
    isa $I1, $P2, [ 'ConcatString' ]
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
    'SyntaxError'("-= can't be applied to string", $P3)
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
# Body
# {
.annotate 'line', 3491
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3494
    self.'optimizearg'()
.annotate 'line', 3495
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3496
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3497
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3498
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3499
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3500
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3502
    .return(self)
# }
.annotate 'line', 3503

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3506
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3507
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3508
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3509
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
 __label_3:
.annotate 'line', 3510
    self.'annotate'(__ARG_1)
.annotate 'line', 3511
# aux: $S5
    null $S5
.annotate 'line', 3512
    iseq $I1, $S1, 'N'
    if $I1 goto __label_6
    iseq $I1, $S2, 'N'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3514
    ne $S1, 'I', __label_7
# {
.annotate 'line', 3515
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3516
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3517
    set $S3, $S5
# }
 __label_7: # endif
.annotate 'line', 3519
    ne $S2, 'I', __label_8
# {
.annotate 'line', 3520
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3521
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3522
    set $S4, $S5
# }
 __label_8: # endif
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 3525
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
 __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 3526
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3527
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3528
    set $S3, $S5
# }
    goto __label_10
 __label_9: # else
.annotate 'line', 3530
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 3531
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3532
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3533
    set $S4, $S5
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 3535
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'P'
 __label_17:
    unless $I1 goto __label_15
# {
.annotate 'line', 3536
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3537
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3538
    set $S3, $S5
# }
    goto __label_16
 __label_15: # else
.annotate 'line', 3540
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_19
    iseq $I1, $S1, 'S'
 __label_19:
    unless $I1 goto __label_18
# {
.annotate 'line', 3541
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3542
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3543
    set $S4, $S5
# }
 __label_18: # endif
 __label_16: # endif
 __label_13: # endif
 __label_10: # endif
 __label_5: # endif
.annotate 'line', 3546
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
.annotate 'line', 3548
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_23: # case
.annotate 'line', 3551
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_24: # case
.annotate 'line', 3554
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_21: # default
 __label_20: # switch end
.annotate 'line', 3555
# }
.annotate 'line', 3557

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3560
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3561

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3564
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3565

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3568
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3569

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
# Body
# {
.annotate 'line', 3584
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3585
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3586
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3587

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3588
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3589
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3592
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3593
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3594
    .return(self)
# }
.annotate 'line', 3595

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3598
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3599
    self.'annotate'(__ARG_1)
.annotate 'line', 3600
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3601
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3602
    __ARG_1.'emitarg1'('not', __ARG_2)
 __label_1: # endif
# }
.annotate 'line', 3603

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3606
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3607
    self.'annotate'(__ARG_1)
.annotate 'line', 3608
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
.annotate 'line', 3609

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3577
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3579
    addattribute $P0, 'expr'
.annotate 'line', 3580
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3616
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3619
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3620

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3623
    self.'optimizearg'()
.annotate 'line', 3624
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3625
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3626
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3627
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3628
    unless $I1 goto __label_0
# {
.annotate 'line', 3629
    unless $I2 goto __label_1
.annotate 'line', 3630
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
 __label_1: # else
.annotate 'line', 3632
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3634
    unless $I2 goto __label_3
.annotate 'line', 3635
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3636
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3637
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3638
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3639
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3640
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3642
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3643
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3644
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3646
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3647
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3648
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
.annotate 'line', 3652
    .return(self)
# }
.annotate 'line', 3653

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3656
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3657

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3660
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3661

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3664
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3665

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3668
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3669

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3614
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3676
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3679
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3680

.end # negated


.sub 'optimize' :method
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
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3687
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3688
    unless $I1 goto __label_0
# {
.annotate 'line', 3689
    unless $I2 goto __label_1
.annotate 'line', 3690
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
 __label_1: # else
.annotate 'line', 3692
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3694
    unless $I2 goto __label_3
.annotate 'line', 3695
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3696
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3697
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3698
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3699
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3700
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3702
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3703
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3704
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3706
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3707
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3708
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
.annotate 'line', 3712
    .return(self)
# }
.annotate 'line', 3713

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3716
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3717

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3720
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3721

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3724
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3725

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3728
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3729

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3674
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
.annotate 'line', 3739
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3740
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3741

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3742
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3745
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3746
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
.annotate 'line', 3747

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3750
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
.annotate 'line', 3751

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3754
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3755
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
 __label_1:
    set $S1, 'isntsame'
 __label_0:
.annotate 'line', 3756
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3757

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3760
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3761

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3764
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3765
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
 __label_1:
    set $S1, 'ne_addr'
 __label_0:
.annotate 'line', 3766
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3767

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3770
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3771
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
 __label_1:
    set $S1, 'eq_addr'
 __label_0:
.annotate 'line', 3772
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3773

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3734
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3736
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3780
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3783
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3784

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3787
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3788

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3791
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3792

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3795
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3796

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3799
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3800

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3778
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3807
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3810
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3811

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3814
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3815

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3818
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3819

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3822
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3823

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3826
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3827

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3805
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3834
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3837
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3838

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3841
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3842

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3845
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3846

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3849
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3850

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3853
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3854

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3832
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3861
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3864
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3865

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3868
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3869

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3872
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3873

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3876
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3877

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3880
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3881

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3859
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3890
    .return('I')
# }
.annotate 'line', 3891

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3886
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 3900
    self.'optimizearg'()
.annotate 'line', 3901
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3902
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3903
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3904
    eq $I1, 0, __label_1
.annotate 'line', 3905
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3907
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3909
    .return(self)
# }
.annotate 'line', 3910

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3913
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
.annotate 'line', 3914
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3915
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
 __label_6:
.annotate 'line', 3916
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
 __label_7:
.annotate 'line', 3917
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3920
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
 __label_8:
.annotate 'line', 3921
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3922
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3923
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3924
    __ARG_1.'emitlabel'($S4)
# }
 __label_4: # endif
# }
.annotate 'line', 3926

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3896
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 3935
    self.'optimizearg'()
.annotate 'line', 3936
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3937
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3938
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3939
    ne $I1, 0, __label_1
.annotate 'line', 3940
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3942
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3944
    .return(self)
# }
.annotate 'line', 3945

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3948
# res: $S1
    null $S1
.annotate 'line', 3949
    if_null __ARG_2, __label_0
.annotate 'line', 3950
    set $S1, __ARG_2
    goto __label_1
 __label_0: # else
.annotate 'line', 3952
    $P1 = self.'tempreg'('I')
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 3953
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 3954
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 3955
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
 __label_6:
.annotate 'line', 3956
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 3959
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
 __label_7:
.annotate 'line', 3960
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3961
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 3962
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3963
    __ARG_1.'emitlabel'($S4)
# }
 __label_3: # endif
# }
.annotate 'line', 3965

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3931
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 3970
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3980
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
.annotate 'line', 3981
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 3982
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 3983
    self.'annotate'(__ARG_1)
.annotate 'line', 3984
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 3985

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3988
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3989

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 3976
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3998
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
.annotate 'line', 3999
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4000
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4001
    self.'annotate'(__ARG_1)
.annotate 'line', 4002
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4003

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4006
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4007

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 3994
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4016
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
.annotate 'line', 4017
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4018
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4019
    self.'annotate'(__ARG_1)
.annotate 'line', 4020
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4021

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4024
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4025

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4012
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
.annotate 'line', 4035
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4036
    isa $I1, __ARG_3, [ 'ConcatString' ]
    unless $I1 goto __label_0
# {
.annotate 'line', 4037
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4038
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_2
.annotate 'line', 4039
    getattribute $P1, self, 'values'
    getattribute $P2, __ARG_4, 'values'
    $P1.'append'($P2)
    goto __label_3
 __label_2: # else
.annotate 'line', 4041
    getattribute $P3, self, 'values'
# predefined push
    push $P3, __ARG_4
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 4043
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_4
# {
.annotate 'line', 4044
    getattribute $P2, __ARG_4, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4045
    getattribute $P1, self, 'values'
    $P1.'unshift'(__ARG_3)
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4048
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_3
    push $P2, __ARG_4
    setattribute self, 'values', $P2
 __label_5: # endif
 __label_1: # endif
# }
.annotate 'line', 4049

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4050
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4053
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4054
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4055
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4056
# i: $I2
    null $I2
# for loop
.annotate 'line', 4057
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4058
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
 __label_0: # for iteration
.annotate 'line', 4057
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4059
    .return($P2)
# }
.annotate 'line', 4060

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4063
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4064
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4065
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4066
    self.'annotate'(__ARG_1)
.annotate 'line', 4067
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4068
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4069
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_0: # for iteration
.annotate 'line', 4068
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4070
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4071

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4074
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4075
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4076
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4077
    self.'annotate'(__ARG_1)
.annotate 'line', 4078
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4079
# i: $I2
    set $I2, 2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4080
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_1: # for iteration
.annotate 'line', 4079
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4081
    .return($S1)
# }
.annotate 'line', 4082

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4085
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4086
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4087
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4088
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4089
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4088
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4090

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4093
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4094
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4095
    self.'annotate'(__ARG_1)
.annotate 'line', 4096
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4097
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4098
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4097
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4099

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4030
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4032
    addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 4108
    self.'optimizearg'()
.annotate 'line', 4109
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4110
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4111
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
 __label_0:
.annotate 'line', 4112
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
 __label_1:
.annotate 'line', 4113
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
 __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4114
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
 __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4115
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4116
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4117
# var t: $P5
    null $P5
.annotate 'line', 4118
# es: $S3
    getattribute $P10, $P3, 'str'
    null $S3
    if_null $P10, __label_6
    set $S3, $P10
 __label_6:
.annotate 'line', 4119
# rs: $S4
    getattribute $P10, $P4, 'str'
    null $S4
    if_null $P10, __label_7
    set $S4, $P10
 __label_7:
.annotate 'line', 4120
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_10
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
 __label_10:
    unless $I3 goto __label_8
.annotate 'line', 4121
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_9
 __label_8: # else
.annotate 'line', 4123
    new $P13, [ 'TokenQuoted' ]
    getattribute $P14, $P3, 'file'
    getattribute $P15, $P3, 'line'
    concat $S6, $S3, $S4
    $P13.'TokenQuoted'($P14, $P15, $S6)
    set $P5, $P13
 __label_9: # endif
.annotate 'line', 4124
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
 __label_4: # endif
.annotate 'line', 4126
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_12
    iseq $I3, $S2, 'I'
 __label_12:
    unless $I3 goto __label_11
# {
.annotate 'line', 4127
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4128
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4129
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4130
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4131
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
 __label_11: # endif
# {
.annotate 'line', 4134
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_13
    unless $P10 goto __label_13
# {
.annotate 'line', 4135
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4136
# lf: $N1
# predefined string
    set $S5, $P8
    set $N1, $S5
.annotate 'line', 4137
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4138
# rf: $N2
# predefined string
    set $S5, $P9
    set $N2, $S5
.annotate 'line', 4139
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
 __label_13: # endif
# }
# }
 __label_2: # endif
.annotate 'line', 4143
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_15
    iseq $I3, $S2, 'S'
 __label_15:
    unless $I3 goto __label_14
# {
.annotate 'line', 4144
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
 __label_14: # endif
.annotate 'line', 4146
    .return(self)
# }
.annotate 'line', 4147

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4150
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4151
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4152
    ne $S1, $S2, __label_2
.annotate 'line', 4153
    .return($S1)
 __label_2: # endif
.annotate 'line', 4154
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4155
    .return('S')
 __label_3: # endif
.annotate 'line', 4156
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4157
    .return('S')
 __label_5: # endif
.annotate 'line', 4158
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4159
    .return('N')
 __label_7: # endif
.annotate 'line', 4160
    .return('I')
# }
.annotate 'line', 4161

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4164
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4165
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4166
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4167
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4168
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 4170
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 4171
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
 __label_4:
.annotate 'line', 4172
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4173
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
 __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4174
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
 __label_9:
.annotate 'line', 4175
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4176
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4177
    set $S4, $S6
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 4180
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4181
    set $S5, $S6
# }
 __label_11: # endif
# }
 __label_7: # endif
.annotate 'line', 4184
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4187
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
 __label_15:
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4188
# l: $S7
    null $S7
.annotate 'line', 4189
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4191
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4192
    __ARG_1.'emitset'($S7, $S4)
# }
 __label_17: # endif
.annotate 'line', 4194
# r: $S8
    null $S8
.annotate 'line', 4195
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
 __label_18: # else
# {
.annotate 'line', 4197
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4198
    __ARG_1.'emitset'($S8, $S5)
# }
 __label_19: # endif
.annotate 'line', 4200
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 4203
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
 __label_13: # endif
# }
 __label_6: # endif
# }
.annotate 'line', 4205

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4104
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 4214
    self.'optimizearg'()
.annotate 'line', 4215
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4216
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4217
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4218
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4219
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4220
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4221
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4222
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4223
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4224
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4225
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 4228
    .return(self)
# }
.annotate 'line', 4229

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4232
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4233
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4234
    ne $S1, $S2, __label_2
.annotate 'line', 4235
    .return($S1)
 __label_2: # endif
.annotate 'line', 4236
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4237
    .return('N')
 __label_3: # endif
.annotate 'line', 4238
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4239
    .return('N')
 __label_5: # endif
.annotate 'line', 4240
    .return('I')
# }
.annotate 'line', 4241

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4244
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4245
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4246
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4247

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4210
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 4256
    self.'optimizearg'()
.annotate 'line', 4257
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4258
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4259
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4260
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 4261
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
 __label_3:
.annotate 'line', 4262
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4263
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4264
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4265
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4266
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4267
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
 __label_4: # endif
# {
.annotate 'line', 4270
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4271
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4272
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4273
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4274
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4275
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
 __label_6: # endif
# }
# }
 __label_0: # endif
.annotate 'line', 4279
    .return(self)
# }
.annotate 'line', 4280

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4283
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4284
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4285
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4286
    ne $S1, $S2, __label_2
.annotate 'line', 4287
    .return($S1)
 __label_2: # endif
.annotate 'line', 4288
    ne $S1, 'S', __label_3
.annotate 'line', 4289
    .return('S')
    goto __label_4
 __label_3: # else
.annotate 'line', 4291
    .return('N')
 __label_4: # endif
# }
.annotate 'line', 4292

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4295
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4296
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4297
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4298
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4299
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4300
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4301
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4302
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4303
# rval: $S5
    null $S5
.annotate 'line', 4304
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 4306
    set $S5, $S4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 4309
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4310
    __ARG_1.'emitset'($S5, $S4)
 __label_3: # switch end
.annotate 'line', 4312
    self.'annotate'(__ARG_1)
.annotate 'line', 4313
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4314
    .return()
# }
 __label_2: # endif
.annotate 'line', 4316
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
.annotate 'line', 4317
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4318
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4319
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4320
    .return()
# }
 __label_6: # endif
.annotate 'line', 4325
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4326
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4327
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4328
# rval: $S6
    null $S6
.annotate 'line', 4329
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
# switch
 __label_13: # case
.annotate 'line', 4331
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4332
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4333
    set $S6, $S4
    goto __label_11 # break
 __label_14: # case
.annotate 'line', 4336
    set $S6, $S4
    goto __label_11 # break
 __label_12: # default
.annotate 'line', 4339
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4340
    __ARG_1.'emitset'($S6, $S4)
 __label_11: # switch end
.annotate 'line', 4342
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4343
    self.'annotate'(__ARG_1)
.annotate 'line', 4344
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
 __label_15: # endif
.annotate 'line', 4346
    .return()
# }
 __label_10: # endif
.annotate 'line', 4349
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4350
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
 __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4351
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4352
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4355
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4356
    set $S3, $I1
# }
 __label_17: # endif
.annotate 'line', 4358
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4359
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4360
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 4363
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
.annotate 'line', 4365
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4366
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
 __label_25: # case
.annotate 'line', 4369
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
 __label_26: # case
 __label_23: # default
.annotate 'line', 4373
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4374
    set $S4, $I2
    goto __label_22 # break
 __label_22: # switch end
.annotate 'line', 4375
# }
 __label_20: # endif
.annotate 'line', 4378
    self.'annotate'(__ARG_1)
.annotate 'line', 4379
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4380
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
 __label_27: # endif
.annotate 'line', 4381
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4382

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4252
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 4391
    self.'optimizearg'()
.annotate 'line', 4392
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4393
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4394
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4395
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4396
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4397
# var lval: $P3
    null $P3
.annotate 'line', 4398
# var rval: $P4
    null $P4
.annotate 'line', 4399
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4400
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4401
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4402
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4403
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4404
    eq $I2, 0, __label_6
.annotate 'line', 4405
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
.annotate 'line', 4408
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4409
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4410
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4411
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4412
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4413
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4414
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
.annotate 'line', 4418
    .return(self)
# }
.annotate 'line', 4419

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4422
    .return('N')
# }
.annotate 'line', 4423

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4426
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4427
# var aux: $P2
    null $P2
.annotate 'line', 4428
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4429
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4430
    $P2 = self.'tempreg'('N')
.annotate 'line', 4431
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4432
    set $P3, $P2
# }
 __label_0: # endif
.annotate 'line', 4434
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4435
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4436
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4437
    $P2 = self.'tempreg'('N')
.annotate 'line', 4438
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4439
    set $P5, $P2
# }
 __label_1: # endif
.annotate 'line', 4441
    self.'annotate'(__ARG_1)
.annotate 'line', 4442
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4443

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4387
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4452
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4453
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4454
    self.'annotate'(__ARG_1)
.annotate 'line', 4455
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4456

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4459
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4460

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4448
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4469
    .return('I')
# }
.annotate 'line', 4470

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4473
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4474
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4475
    self.'annotate'(__ARG_1)
.annotate 'line', 4480
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4481

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4465
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4490
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
.annotate 'line', 4491
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4492
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4493
    self.'annotate'(__ARG_1)
.annotate 'line', 4494
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4495

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4498
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4499

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4486
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4508
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
.annotate 'line', 4509
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4510
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4511
    self.'annotate'(__ARG_1)
.annotate 'line', 4512
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4513

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4516
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4517

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4504
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4528
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4529
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4530

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4533
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4534
    .return(self)
# }
.annotate 'line', 4535

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4538
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4539

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4524
    addattribute $P0, 'arg'
.annotate 'line', 4525
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
.annotate 'line', 4551
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4552
    setattribute self, 'start', __ARG_2
.annotate 'line', 4553
# var args: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4554
# var t: $P2
    $P2 = __ARG_3.'get'()
.annotate 'line', 4555
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 4556
    __ARG_3.'unget'($P2)
 __label_1: # do
.annotate 'line', 4557
# {
.annotate 'line', 4558
# var modifier: $P3
    null $P3
.annotate 'line', 4559
# var expr: $P4
    $P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4560
    $P2 = __ARG_3.'get'()
.annotate 'line', 4561
    $P5 = $P2.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4562
    $P2 = __ARG_3.'get'()
.annotate 'line', 4563
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4564
    new $P6, [ 'ModifierList' ]
    $P6.'ModifierList'(__ARG_3, __ARG_1)
    set $P3, $P6
.annotate 'line', 4565
    $P2 = __ARG_3.'get'()
# }
    goto __label_6
 __label_5: # else
.annotate 'line', 4568
    'Expected'('modifier list', $P2)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 4570
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P4, $P3)
    set $P5, $P6
# predefined push
    push $P1, $P5
# }
 __label_3: # continue
.annotate 'line', 4571
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 4572
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_7
.annotate 'line', 4573
    'SyntaxError'("Unfinished argument list", $P2)
 __label_7: # endif
.annotate 'line', 4574
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_8
.annotate 'line', 4575
    setattribute self, 'args', $P1
 __label_8: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 4577

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4580
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4581
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
    .return($I1)
# }
.annotate 'line', 4582

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4585
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4586

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4589
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4590
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4591

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4594
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4595
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4596

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4599
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 4600
    .return(self)
# }
.annotate 'line', 4601

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4604
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4605
    unless_null $P1, __label_0
# {
.annotate 'line', 4606
    new $P2, ['ResizableStringArray']
.annotate 'line', 4607
# pnull: $S1
    set $S1, ''
.annotate 'line', 4608
    set $P1, $P2
.annotate 'line', 4609
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4610
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4611
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4612
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4613
# reg: $S2
    null $S2
.annotate 'line', 4614
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4616
    ne $S1, '', __label_6
# {
.annotate 'line', 4617
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4618
    __ARG_1.'emitnull'($S1)
# }
 __label_6: # endif
.annotate 'line', 4620
    set $S2, $S1
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4623
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
 __label_5: # endif
.annotate 'line', 4624
# predefined push
    push $P1, $S2
# }
 __label_1: # for iteration
.annotate 'line', 4611
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4626
    setattribute self, 'argregs', $P1
# }
 __label_0: # endif
.annotate 'line', 4628
    .return($P1)
# }
.annotate 'line', 4629

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4632
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4633
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4635
# sep: $S1
    set $S1, ''
.annotate 'line', 4636
# n: $I1
    $P6 = self.'numargs'()
    set $I1, $P6
# for loop
.annotate 'line', 4637
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4638
# a: $S2
    $S2 = $P2[$I2]
.annotate 'line', 4639
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 4640
# var modifiers: $P3
    $P6 = $P1[$I2]
    getattribute $P3, $P6, 'modifiers'
.annotate 'line', 4641
    if_null $P3, __label_3
# {
.annotate 'line', 4642
# isflat: $I3
    null $I3
# isnamed: $I4
    null $I4
.annotate 'line', 4643
# setname: $S3
    set $S3, ''
.annotate 'line', 4644
    $P6 = $P3.'getlist'()
    iter $P7, $P6
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4645
# name: $S4
    $P8 = $P4.'getname'()
    null $S4
    if_null $P8, __label_6
    set $S4, $P8
 __label_6:
.annotate 'line', 4646
    ne $S4, 'flat', __label_7
.annotate 'line', 4647
    set $I3, 1
 __label_7: # endif
.annotate 'line', 4648
    ne $S4, 'named', __label_8
# {
.annotate 'line', 4649
    set $I4, 1
.annotate 'line', 4650
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
.annotate 'line', 4654
# var argmod: $P5
    $P5 = $P4.'getarg'(0)
.annotate 'line', 4655
    $P8 = $P5.'isstringliteral'()
    isfalse $I7, $P8
    unless $I7 goto __label_13
.annotate 'line', 4656
    getattribute $P9, self, 'start'
    'SyntaxError'('Invalid modifier', $P9)
 __label_13: # endif
.annotate 'line', 4657
    $P10 = $P5.'getPirString'()
    set $S3, $P10
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 4660
    getattribute $P11, self, 'start'
    'SyntaxError'('Invalid modifier', $P11)
 __label_9: # switch end
# }
 __label_8: # endif
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 4664
    unless $I3 goto __label_14
# {
.annotate 'line', 4665
    unless $I4 goto __label_16
.annotate 'line', 4666
    __ARG_1.'print'(' :flat :named')
    goto __label_17
 __label_16: # else
.annotate 'line', 4668
    __ARG_1.'print'(' :flat')
 __label_17: # endif
# }
    goto __label_15
 __label_14: # else
.annotate 'line', 4670
    unless $I4 goto __label_18
# {
.annotate 'line', 4671
    __ARG_1.'print'(' :named')
.annotate 'line', 4672
    eq $S3, '', __label_19
.annotate 'line', 4673
    __ARG_1.'print'("(", $S3, ")")
 __label_19: # endif
# }
 __label_18: # endif
 __label_15: # endif
# }
 __label_3: # endif
.annotate 'line', 4676
    set $S1, ', '
# }
 __label_0: # for iteration
.annotate 'line', 4637
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4678

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4544
    addattribute $P0, 'owner'
.annotate 'line', 4545
    addattribute $P0, 'start'
.annotate 'line', 4546
    addattribute $P0, 'args'
.annotate 'line', 4547
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4683
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4684
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4685
    .return(0)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4686
    .return(1)
# }
.annotate 'line', 4687

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4698
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4699
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4700
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4701

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4704
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4705

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4708
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4709
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4710
    new $P3, ['ResizableStringArray']
.annotate 'line', 4711
# var arg: $P4
    null $P4
.annotate 'line', 4712
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4713
# pnull: $S1
    set $S1, ''
.annotate 'line', 4714
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 4716
    iter $P7, $P2
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4717
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 4719
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4720
    ne $S1, '', __label_8
# {
.annotate 'line', 4721
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4722
    __ARG_1.'emitnull'($S1)
# }
 __label_8: # endif
.annotate 'line', 4724
    set $S2, $S1
# }
 __label_7: # endif
.annotate 'line', 4726
# predefined push
    push $P3, $S2
# }
    goto __label_4
 __label_5: # endfor
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 4730
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4731
    iter $P9, $P2
    set $P9, 0
 __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4732
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
 __label_10: # endfor
.annotate 'line', 4733
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4734
    .return()
 __label_1: # default
.annotate 'line', 4736
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4737
# i: $I3
    null $I3
 __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4738
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4739
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
 __label_14:
.annotate 'line', 4740
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
 __label_15:
.annotate 'line', 4741
# argr: $S5
    null $S5
.annotate 'line', 4742
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
.annotate 'line', 4743
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
.annotate 'line', 4747
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4748
    __ARG_1.'emitnull'($S5)
    goto __label_18 # break
 __label_19: # default
.annotate 'line', 4751
    ne $S1, '', __label_23
# {
.annotate 'line', 4752
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4753
    __ARG_1.'emitnull'($S1)
# }
 __label_23: # endif
.annotate 'line', 4755
    set $S5, $S1
 __label_18: # switch end
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4759
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
 __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4760
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 4762
# aux: $S6
    null $S6
.annotate 'line', 4763
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
.annotate 'line', 4764
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
.annotate 'line', 4766
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
.annotate 'line', 4770
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4771
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 4774
    $P4.'emit'(__ARG_1, $S5)
 __label_33: # switch end
    goto __label_27 # break
 __label_30: # case
 __label_31: # case
 __label_32: # case
.annotate 'line', 4780
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4781
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
 __label_28: # default
.annotate 'line', 4784
    $P4.'emit'(__ARG_1, $S5)
 __label_27: # switch end
# }
 __label_25: # endif
# }
 __label_17: # endif
.annotate 'line', 4788
# predefined push
    push $P3, $S5
# }
 __label_11: # for iteration
.annotate 'line', 4737
    inc $I3
    goto __label_13
 __label_12: # for end
 __label_0: # switch end
.annotate 'line', 4791
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4792

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4691
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4693
    addattribute $P0, 'predef'
.annotate 'line', 4694
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
.annotate 'line', 4804
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4805
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4806
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4807
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4808
    __ARG_1.'unget'($P1)
.annotate 'line', 4809
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 4811

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4812
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4815
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4816
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4817
# nargs: $I1
    null $I1
.annotate 'line', 4818
    if_null $P2, __label_0
# {
.annotate 'line', 4819
    $P2 = $P2.'optimize'()
.annotate 'line', 4820
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
 __label_0: # endif
.annotate 'line', 4823
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_1
.annotate 'line', 4824
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_1: # endif
.annotate 'line', 4825
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 4826
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_2: # endif
.annotate 'line', 4829
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4830
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 4831
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4832
    if_null $P3, __label_5
# {
.annotate 'line', 4833
    self.'use_predef'($S1)
.annotate 'line', 4834
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
 __label_7:
    $P4 = $P2.'getrawargs'()
 __label_6:
.annotate 'line', 4837
    isa $I2, $P3, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_8
# {
.annotate 'line', 4838
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4839
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4840
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
 __label_9: # endif
# }
 __label_8: # endif
.annotate 'line', 4844
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
.annotate 'line', 4848
    setattribute self, 'funref', $P1
.annotate 'line', 4849
    setattribute self, 'args', $P2
.annotate 'line', 4850
    .return(self)
# }
.annotate 'line', 4851

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 4854
    .return(1)
# }
.annotate 'line', 4855

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4858
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4859
# call: $S1
    null $S1
.annotate 'line', 4860
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4861
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 4862
    ne $S1, '', __label_2
.annotate 'line', 4863
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
.annotate 'line', 4866
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 4867
    .return($S1)
# }
.annotate 'line', 4868

.end # emitcall


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4871
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4872
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4873
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4874
    if_null $P2, __label_1
.annotate 'line', 4875
    $P2.'getargvalues'(__ARG_1)
 __label_1: # endif
.annotate 'line', 4877
    self.'annotate'(__ARG_1)
.annotate 'line', 4879
    __ARG_1.'print'('    ')
.annotate 'line', 4880
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 4881
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 4882
    __ARG_1.'print'('.tailcall ')
    goto __label_5
 __label_4: # else
.annotate 'line', 4884
    __ARG_1.'print'(__ARG_2, ' = ')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 4887
    __ARG_1.'print'($S1)
.annotate 'line', 4888
    __ARG_1.'print'('(')
.annotate 'line', 4889
    if_null $P2, __label_6
.annotate 'line', 4890
    $P2.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 4891
    __ARG_1.'say'(')')
# }
.annotate 'line', 4892

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4797
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4799
    addattribute $P0, 'funref'
.annotate 'line', 4800
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 4904
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4905
    setattribute self, 'funref', __ARG_2
.annotate 'line', 4906
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4907

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4910
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4911
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 4912
    $P5 = $P1.'get_member'()
.annotate 'line', 4911
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 4913

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 4900
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
.annotate 'line', 4923
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4924
    setattribute self, 'funref', __ARG_2
.annotate 'line', 4925
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 4926

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4929
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4930
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 4931
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 4932
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 4933
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
 __label_0: # endif
.annotate 'line', 4936
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
 __label_2:
.annotate 'line', 4937
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
 __label_3:
.annotate 'line', 4938
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 4939

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 4919
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
.annotate 'line', 4949
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4950
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 4951

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4954
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 4955
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4956
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4957
    eq $S1, 'P', __label_2
# {
.annotate 'line', 4958
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 4959
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 4960
    __ARG_1.'emitbox'($S2, $S3)
# }
 __label_2: # endif
.annotate 'line', 4962
    .return($S2)
# }
.annotate 'line', 4963

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 4944
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4946
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
.annotate 'line', 4972
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 4973
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 4974

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4975
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4978
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 4979
    .return(self)
# }
.annotate 'line', 4980

.end # optimize


.sub 'get_member' :method
# Body
# {
.annotate 'line', 4983
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 4984

.end # get_member


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4987
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4988
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4989
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 4990
    self.'annotate'(__ARG_1)
.annotate 'line', 4991
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 4992
    .return($S3)
# }
.annotate 'line', 4993

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4996
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4997
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4998
    self.'annotate'(__ARG_1)
.annotate 'line', 4999
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5000

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5003
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5004

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5007
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5008
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5009
# value: $S3
    null $S3
.annotate 'line', 5010
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5012
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5013
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5014
    __ARG_1.'emitnull'(__ARG_3)
# }
 __label_4: # endif
.annotate 'line', 5016
    set $S3, __ARG_3
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 5019
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 5020
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
 __label_3: # endif
.annotate 'line', 5022
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 5023

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5026
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5027
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5028
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5029
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5030
    __ARG_1.'emitnull'($S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 5032
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
 __label_5:
.annotate 'line', 5033
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 5034
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
 __label_6: # else
.annotate 'line', 5036
    set $S3, $S4
 __label_7: # endif
# }
 __label_4: # endif
.annotate 'line', 5038
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 5039
    .return($S3)
# }
.annotate 'line', 5040

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 4966
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 4968
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
.annotate 'line', 5050
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5051
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5052

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5053
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5056
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5057
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5058
    .return(self)
# }
.annotate 'line', 5059

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5063
    getattribute $P1, self, 'start'
.annotate 'line', 5062
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 5064

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5045
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5047
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
.annotate 'line', 5077
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5078
    setattribute self, 'left', __ARG_4
.annotate 'line', 5079
    self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5080

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5083
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5084
    .return('S')
    goto __label_1
 __label_0: # else
.annotate 'line', 5086
    .return('P')
 __label_1: # endif
# }
.annotate 'line', 5087

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5090
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 5091
    setattribute self, 'left', $P1
.annotate 'line', 5092
    self.'optimizeargs'()
.annotate 'line', 5096
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P4 = self.'numargs'()
    set $I3, $P4
    iseq $I2, $I3, 1
 __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5097
# var arg: $P2
    $P2 = self.'getarg'(0)
.annotate 'line', 5098
    $P4 = $P2.'isintegerliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 5099
# ival: $I1
    $P5 = $P2.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5100
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 5101
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, self, 'start'
    getattribute $P5, $P4, 'file'
    getattribute $P6, self, 'start'
    getattribute $P7, $P6, 'line'
.annotate 'line', 5102
# predefined substr
    substr $S2, $S1, $I1, 1
    $P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5103
    new $P5, [ 'StringLiteral' ]
    getattribute $P6, self, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5106
    .return(self)
# }
.annotate 'line', 5107

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5110
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5111
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5112
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5113
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
 __label_0: # endif
.annotate 'line', 5114
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5115
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
 __label_2: # else
.annotate 'line', 5117
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
 __label_3: # endif
.annotate 'line', 5118
    setattribute self, 'regleft', $P1
.annotate 'line', 5119
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5120
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5121

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5124
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5125
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5126
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5127
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
 __label_0: # endif
.annotate 'line', 5128
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5129
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5130
    __ARG_1.'print'(']')
# }
.annotate 'line', 5131

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5134
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5135
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5136
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5137
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5138
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5139
    eq $I1, 1, __label_3
.annotate 'line', 5140
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
 __label_3: # endif
.annotate 'line', 5141
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5142
    __ARG_2 = self.'tempreg'('S')
 __label_4: # endif
.annotate 'line', 5143
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 5146
    self.'annotate'(__ARG_1)
.annotate 'line', 5147
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5148
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5149
    __ARG_1.'say'('')
# }
 __label_2: # endif
# }
.annotate 'line', 5151

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5154
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5155
    self.'annotate'(__ARG_1)
.annotate 'line', 5156
    __ARG_1.'print'('    ')
.annotate 'line', 5157
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5158
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5159

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5162
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5163
# rreg: $S1
    null $S1
.annotate 'line', 5164
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5165
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5166
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5169
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5170
    self.'annotate'(__ARG_1)
.annotate 'line', 5171
    __ARG_1.'print'('    ')
.annotate 'line', 5172
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5173
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5174
    .return($S1)
# }
.annotate 'line', 5175

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5069
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'SimpleArgList' ]
    addparent $P0, $P2
.annotate 'line', 5071
    addattribute $P0, 'left'
.annotate 'line', 5072
    addattribute $P0, 'regleft'
.annotate 'line', 5073
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5186
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5187
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
.annotate 'line', 5188
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5189
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 5190
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5191
# {
.annotate 'line', 5192
# var item: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5193
    getattribute $P3, self, 'values'
# predefined push
    push $P3, $P2
# }
 __label_3: # continue
.annotate 'line', 5194
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 5195
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 5196
    'Expected'("']' or ','", $P1)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 5198

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5199
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5202
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5203
    .return(self)
# }
.annotate 'line', 5204

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5207
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5208
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 5209
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5215
    self.'emit_init'(__ARG_1, '')
# }
 __label_1: # endif
# }
.annotate 'line', 5217

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5220
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5221
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5222
    .return($S1)
# }
.annotate 'line', 5223

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5226
    self.'annotate'(__ARG_1)
.annotate 'line', 5227
# itemreg: $S1
    null $S1
.annotate 'line', 5228
# it_p: $S2
    null $S2
.annotate 'line', 5229
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5230
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5231
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
 __label_0: # endif
.annotate 'line', 5233
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5234
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
 __label_3:
.annotate 'line', 5235
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
.annotate 'line', 5237
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 5238
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5239
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5240
    set $S1, $S2
# }
 __label_10: # endif
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 5244
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5245
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5246
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5247
    __ARG_1.'emitnull'($S1)
# }
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
.annotate 'line', 5251
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_12: # endif
 __label_4: # switch end
.annotate 'line', 5253
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5254
    self.'annotate'(__ARG_1)
.annotate 'line', 5255
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
 __label_14: # endif
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 5258

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5180
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5182
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5270
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5271
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5272
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5273
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5274
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5275
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5276
# {
.annotate 'line', 5277
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5278
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5279
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5280
# predefined push
    push $P2, $P4
.annotate 'line', 5281
# predefined push
    push $P3, $P5
# }
 __label_3: # continue
.annotate 'line', 5283
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
 __label_2: # enddo
.annotate 'line', 5284
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5285
    'Expected'("',' or '}'", $P1)
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 5287
    setattribute self, 'keys', $P2
.annotate 'line', 5288
    setattribute self, 'values', $P3
# }
.annotate 'line', 5289

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5290
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5293
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5294
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5295
    .return(self)
# }
.annotate 'line', 5296

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5299
    self.'annotate'(__ARG_1)
.annotate 'line', 5304
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5305
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
 __label_0: # endif
.annotate 'line', 5307
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5308
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5309
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5310
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5311
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5312
# item: $S1
    null $S1
.annotate 'line', 5313
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5314
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5315
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5316
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5319
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
 __label_5: # endif
.annotate 'line', 5321
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5322
# itemreg: $S3
    null $S3
.annotate 'line', 5323
    $P5 = $P4.'isnull'()
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 5324
    set $S6, __ARG_2
    eq $S6, '', __label_9
# {
.annotate 'line', 5325
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5326
    __ARG_1.'emitnull'($S3)
# }
 __label_9: # endif
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5329
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5330
# s: $S4
    $P6 = $P4.'checkIdentifier'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 5331
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
 __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5332
    set $S3, $S4
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 5334
# id: $S5
    $P5 = $P4.'getName'()
    null $S5
    if_null $P5, __label_16
    set $S5, $P5
 __label_16:
.annotate 'line', 5335
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5336
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5337
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
 __label_17: # else
.annotate 'line', 5340
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_18: # endif
# }
 __label_14: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 5344
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_11: # endif
 __label_8: # endif
.annotate 'line', 5345
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5346
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
 __label_19: # endif
# }
 __label_1: # for iteration
.annotate 'line', 5310
    inc $I2
    goto __label_3
 __label_2: # for end
# }
.annotate 'line', 5348

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5351
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5352
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5353
    .return($S1)
# }
.annotate 'line', 5354

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5263
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5265
    addattribute $P0, 'keys'
.annotate 'line', 5266
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5363
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5368
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 5369
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5370
    $P5 = $P2.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 5371
    __ARG_1.'unget'($P2)
.annotate 'line', 5372
# var initializer: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
 __label_1: # do
.annotate 'line', 5373
# {
.annotate 'line', 5374
# var auxinit: $P4
    $P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5375
# predefined push
    push $P3, $P4
# }
 __label_3: # continue
.annotate 'line', 5376
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 5377
    setattribute self, 'initializer', $P3
.annotate 'line', 5378
    'RequireOp'(')', $P2)
# }
 __label_0: # endif
# }
.annotate 'line', 5380

.end # parseinitializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5383
    getattribute $P1, self, 'initializer'
    'optimize_array'($P1)
.annotate 'line', 5384
    .return(self)
# }
.annotate 'line', 5385

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5359
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5361
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
.annotate 'line', 5396
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5398
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
 __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5399
    'SyntaxError'("Unimplemented", __ARG_4)
 __label_0: # endif
.annotate 'line', 5400
    setattribute self, 'value', __ARG_4
.annotate 'line', 5401
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5403
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5404
    self.'parseinitializer'(__ARG_1)
    goto __label_3
 __label_2: # else
.annotate 'line', 5406
    __ARG_1.'unget'($P1)
 __label_3: # endif
# }
.annotate 'line', 5407

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5410
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5411
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5414
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5415
# var desc: $P3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'getvar'($P2)
.annotate 'line', 5416
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5417
    $P4 = $P3.'getid'()
    unless_null $P4, __label_4
# {
.annotate 'line', 5418
    $P1 = $P3.'getvalue'()
.annotate 'line', 5419
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5420
    'SyntaxError'('Constant value must evaluate to a string', $P1)
 __label_6: # endif
.annotate 'line', 5421
    getattribute $P5, $P1, 'strval'
    setattribute self, 'value', $P5
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5424
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
 __label_5: # endif
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5428
    getattribute $P4, self, 'initializer'
    'optimize_array'($P4)
.annotate 'line', 5429
    .return(self)
# }
.annotate 'line', 5430

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5433
    self.'annotate'(__ARG_1)
.annotate 'line', 5435
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5436
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
.annotate 'line', 5439
# type: $I2
    getattribute $P9, self, 'value'
    $P8 = $P9.'isstring'()
    if_null $P8, __label_3
    unless $P8 goto __label_3
    null $I2
    goto __label_2
 __label_3:
.annotate 'line', 5440
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
.annotate 'line', 5442
# reginit: $S1
    set $S1, ''
.annotate 'line', 5443
# regnew: $S2
    set $P8, __ARG_2
    null $S2
    if_null $P8, __label_6
    set $S2, $P8
 __label_6:
.annotate 'line', 5444
# constructor: $S3
    null $S3
.annotate 'line', 5445
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
.annotate 'line', 5449
    ne $I2, 1, __label_11
# {
.annotate 'line', 5450
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 5451
    $P8 = self.'tempreg'('P')
    set $S2, $P8
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
# {
.annotate 'line', 5454
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5455
    $P8 = $P2.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 5456
    concat $S0, ', ', $S1
    set $S1, $S0
# }
 __label_12: # endif
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 5460
    eq $I2, 1, __label_14
.annotate 'line', 5461
    getattribute $P8, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P8)
 __label_14: # endif
.annotate 'line', 5462
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 5463
    $P9 = self.'tempreg'('P')
    set $S2, $P9
 __label_15: # endif
 __label_7: # switch end
.annotate 'line', 5466
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_18
    set $I4, 1
    if $I3 == $I4 goto __label_19
    goto __label_17
# switch
 __label_18: # case
.annotate 'line', 5469
# name: $S4
    getattribute $P9, self, 'value'
    $P8 = $P9.'rawstring'()
    null $S4
    if_null $P8, __label_20
    set $S4, $P8
 __label_20:
.annotate 'line', 5470
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5471
    isnull $I5, $P3
    unless $I5 goto __label_22
    $I5 = self.'dowarnings'()
 __label_22:
    unless $I5 goto __label_21
.annotate 'line', 5472
    concat $S6, "Can't locate class ", $S4
    concat $S6, $S6, " at compile time"
    getattribute $P10, self, 'value'
    'Warn'($S6, $P10)
 __label_21: # endif
.annotate 'line', 5476
    getattribute $P11, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P11, " ]", $S1)
.annotate 'line', 5477
    le $I1, 1, __label_23
# {
.annotate 'line', 5478
    getattribute $P12, self, 'value'
    __ARG_1.'say'($S2, ".'", $P12, "'()")
# }
 __label_23: # endif
    goto __label_16 # break
 __label_19: # case
.annotate 'line', 5482
# var id: $P4
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P4 = $P8.'getvar'($P9)
.annotate 'line', 5483
    unless_null $P4, __label_24
# {
.annotate 'line', 5485
# var cl: $P5
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'value'
    $P5 = $P10.'checkclass'($P11)
.annotate 'line', 5486
    if_null $P5, __label_26
# {
.annotate 'line', 5487
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
# }
    goto __label_27
 __label_26: # else
# {
.annotate 'line', 5490
    $P8 = self.'dowarnings'()
    if_null $P8, __label_28
    unless $P8 goto __label_28
.annotate 'line', 5491
    'Warn'('Checking: new unknown type')
 __label_28: # endif
.annotate 'line', 5492
    getattribute $P8, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P8, "']", $S1)
# }
 __label_27: # endif
.annotate 'line', 5494
    getattribute $P8, self, 'value'
    set $S3, $P8
# }
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 5498
    $P8 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
# }
 __label_25: # endif
    goto __label_16 # break
 __label_17: # default
.annotate 'line', 5502
    'InternalError'('Unexpected type in new')
 __label_16: # switch end
.annotate 'line', 5504
    isgt $I3, $I1, 1
    if $I3 goto __label_30
    isgt $I3, $I1, 0
    unless $I3 goto __label_31
    iseq $I3, $I2, 1
 __label_31:
 __label_30:
    unless $I3 goto __label_29
# {
.annotate 'line', 5505
    new $P6, ['ResizableStringArray']
.annotate 'line', 5506
    iter $P13, $P1
    set $P13, 0
 __label_32: # for iteration
    unless $P13 goto __label_33
    shift $P7, $P13
# {
.annotate 'line', 5507
# reg: $S5
    $P8 = $P7.'emit_get'(__ARG_1)
    null $S5
    if_null $P8, __label_34
    set $S5, $P8
 __label_34:
.annotate 'line', 5508
# predefined push
    push $P6, $S5
# }
    goto __label_32
 __label_33: # endfor
.annotate 'line', 5510
    __ARG_1.'print'('    ', $S2, ".'", $S3, "'(")
.annotate 'line', 5511
# predefined join
    join $S6, ", ", $P6
    __ARG_1.'print'($S6)
.annotate 'line', 5512
    __ARG_1.'say'(")")
.annotate 'line', 5513
    not $I3, __ARG_3
    unless $I3 goto __label_35
.annotate 'line', 5514
    __ARG_1.'emitset'(__ARG_2, $S2)
 __label_35: # endif
# }
 __label_29: # endif
# }
.annotate 'line', 5516

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5519
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5520

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5390
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5392
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5531
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5532
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5533
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5534
    setattribute self, 'nskey', $P1
.annotate 'line', 5535
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5536
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5537
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5539
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5540

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5543
# reginit: $S1
    null $S1
.annotate 'line', 5544
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5545
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5546
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
.annotate 'line', 5550
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5551
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5554
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
 __label_2: # switch end
.annotate 'line', 5556
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5557
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5558
    __ARG_1.'print'("root_")
 __label_6: # endif
.annotate 'line', 5559
    __ARG_1.'print'('    ', 'new ', __ARG_2, ", ")
.annotate 'line', 5560
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5561
    if_null $S1, __label_7
.annotate 'line', 5562
    __ARG_1.'print'(', ', $S1)
 __label_7: # endif
.annotate 'line', 5563
    __ARG_1.'say'()
# }
.annotate 'line', 5564

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5525
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5527
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5575
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5576
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5577
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5578
    setattribute self, 'nskey', $P1
.annotate 'line', 5579
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5580
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5581
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5583
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5584

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5587
# reginit: $S1
    null $S1
.annotate 'line', 5588
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5590
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5591
# regnew: $S2
    set $P5, __ARG_2
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
 __label_2:
.annotate 'line', 5592
    le $I1, 0, __label_3
.annotate 'line', 5593
    $P5 = self.'tempreg'('P')
    set $S2, $P5
 __label_3: # endif
.annotate 'line', 5594
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5595
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5596
    getattribute $P5, self, 'owner'
    $P2.'emit'(__ARG_1, $P5)
.annotate 'line', 5597
    __ARG_1.'say'()
.annotate 'line', 5599
    le $I1, 0, __label_4
# {
.annotate 'line', 5600
    new $P3, ['ResizableStringArray']
.annotate 'line', 5601
    iter $P6, $P1
    set $P6, 0
 __label_5: # for iteration
    unless $P6 goto __label_6
    shift $P4, $P6
# {
.annotate 'line', 5602
# reg: $S3
    $P5 = $P4.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
 __label_7:
.annotate 'line', 5603
# predefined push
    push $P3, $S3
# }
    goto __label_5
 __label_6: # endfor
.annotate 'line', 5605
# constructor: $S4
    $P5 = $P2.'last'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
 __label_8:
.annotate 'line', 5606
    __ARG_1.'print'('    ', $S2, ".'", $S4, "'(")
.annotate 'line', 5607
# predefined join
    join $S5, ", ", $P3
    __ARG_1.'print'($S5)
.annotate 'line', 5608
    __ARG_1.'say'(")")
.annotate 'line', 5609
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
 __label_4: # endif
# }
.annotate 'line', 5611

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5569
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5571
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5618
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5620
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 5622
    new $P5, [ 'CallExpr' ]
.annotate 'line', 5623
    new $P7, [ 'StringLiteral' ]
    $P7.'StringLiteral'(__ARG_2, __ARG_3)
    set $P6, $P7
    $P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
    set $P4, $P5
.annotate 'line', 5622
    .return($P4)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5625
    $P3 = $P1.'isop'('[')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 5627
    new $P5, [ 'NewIndexedExpr' ]
    $P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 5629
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 5632
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5633
    __ARG_1.'unget'($P2)
.annotate 'line', 5634
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 5636
    new $P5, [ 'NewQualifiedExpr' ]
    $P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 5640
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
.annotate 'line', 5645
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_5: # endif
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5647

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5658
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5659
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5660
    $P2 = 'parseClassSpecifier'(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5661

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5664
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5665
    .return(self)
# }
.annotate 'line', 5666

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5667
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5670
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5672
# r: $S1
    null $S1
.annotate 'line', 5673
    set $S3, __ARG_2
    ne $S3, '', __label_0
.annotate 'line', 5674
    $P2 = self.'tempreg'('I')
    set $S1, $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 5676
    set $S1, __ARG_2
 __label_1: # endif
.annotate 'line', 5677
# check: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 5678
    self.'annotate'(__ARG_1)
.annotate 'line', 5679
    __ARG_1.'print'('    isa ', $S1, ', ', $S2, ', ')
.annotate 'line', 5680
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 5681
    __ARG_1.'say'()
# }
.annotate 'line', 5682

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5651
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5653
    addattribute $P0, 'lexpr'
.annotate 'line', 5654
    addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 5699
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5700
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5701
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5702
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5703
    .return(self)
# }
.annotate 'line', 5704

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5707
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 5708
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
.annotate 'line', 5710
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
 __label_3: # case
.annotate 'line', 5712
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
 __label_1: # default
.annotate 'line', 5714
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5715
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5716
    .return(self)
 __label_0: # switch end
# }
.annotate 'line', 5718

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5721
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5722

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5725
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5726
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5727
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5728
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5729
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5730
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5731
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5732
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5733

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5687
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5693
    addattribute $P0, 'condition'
.annotate 'line', 5694
    addattribute $P0, 'etrue'
.annotate 'line', 5695
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
.annotate 'line', 5777
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
.annotate 'line', 5778
    .return(1)
 __label_3: # case
.annotate 'line', 5779
    .return(2)
 __label_4: # case
.annotate 'line', 5780
    .return(3)
 __label_1: # default
.annotate 'line', 5781
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5783

.end # getOpCode_2


.sub 'getOpCode_4'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5787
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
.annotate 'line', 5788
    .return(8)
 __label_3: # case
.annotate 'line', 5789
    .return(11)
 __label_4: # case
.annotate 'line', 5790
    .return(9)
 __label_5: # case
.annotate 'line', 5791
    .return(10)
 __label_1: # default
.annotate 'line', 5793
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
 __label_6: # else
.annotate 'line', 5794
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
 __label_8: # else
.annotate 'line', 5795
    .return(0)
 __label_9: # endif
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5797

.end # getOpCode_4


.sub 'getOpCode_5'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5801
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
.annotate 'line', 5802
    .return(19)
 __label_3: # case
.annotate 'line', 5803
    .return(20)
 __label_4: # case
.annotate 'line', 5804
    .return(21)
 __label_5: # case
.annotate 'line', 5805
    .return(22)
 __label_1: # default
.annotate 'line', 5806
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5808

.end # getOpCode_5


.sub 'getOpCode_7'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5812
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5813
    .return(28)
 __label_3: # case
.annotate 'line', 5814
    .return(29)
 __label_1: # default
.annotate 'line', 5815
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5817

.end # getOpCode_7


.sub 'getOpCode_8'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5821
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
.annotate 'line', 5822
    .return(14)
 __label_3: # case
.annotate 'line', 5823
    .return(16)
 __label_4: # case
.annotate 'line', 5824
    .return(15)
 __label_5: # case
.annotate 'line', 5825
    .return(17)
 __label_1: # default
.annotate 'line', 5827
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
 __label_6: # else
.annotate 'line', 5828
    .return(0)
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5830

.end # getOpCode_8


.sub 'getOpCode_9'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5834
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
.annotate 'line', 5835
    .return(12)
 __label_3: # case
.annotate 'line', 5836
    .return(13)
 __label_4: # case
.annotate 'line', 5837
    .return(25)
 __label_5: # case
.annotate 'line', 5838
    .return(26)
 __label_1: # default
.annotate 'line', 5839
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5841

.end # getOpCode_9


.sub 'getOpCode_16'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5845
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
.annotate 'line', 5846
    .return(4)
 __label_3: # case
.annotate 'line', 5847
    .return(5)
 __label_4: # case
.annotate 'line', 5848
    .return(6)
 __label_5: # case
.annotate 'line', 5849
    .return(18)
 __label_6: # case
.annotate 'line', 5850
    .return(23)
 __label_7: # case
.annotate 'line', 5851
    .return(24)
 __label_8: # case
.annotate 'line', 5852
    .return(30)
 __label_1: # default
.annotate 'line', 5853
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5855

.end # getOpCode_16


.sub 'parseExpr_0'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5859
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5861
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5862
# var expr: $P2
    null $P2
.annotate 'line', 5863
    $P4 = $P1.'isop'('(')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 5864
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5865
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 5866
    .return($P2)
# }
 __label_0: # endif
.annotate 'line', 5868
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 5869
    new $P6, [ 'ArrayExpr' ]
    $P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 5870
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 5871
    new $P6, [ 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 5872
    $P4 = $P1.'isstring'()
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 5873
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_3: # endif
.annotate 'line', 5874
    $P4 = $P1.'isint'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5875
    new $P6, [ 'IntegerLiteral' ]
    $P6.'IntegerLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_4: # endif
.annotate 'line', 5876
    $P4 = $P1.'isfloat'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 5877
    new $P6, [ 'FloatLiteral' ]
    $P6.'FloatLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_5: # endif
.annotate 'line', 5878
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
.annotate 'line', 5880
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
 __label_9: # case
.annotate 'line', 5882
    new $P6, [ 'FunctionExpr' ]
    $P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_10: # case
.annotate 'line', 5884
    new $P8, [ 'OpClassExpr' ]
    $P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P7, $P8
    .return($P7)
 __label_7: # default
 __label_6: # switch end
.annotate 'line', 5886
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_11
    unless $P4 goto __label_11
.annotate 'line', 5887
    new $P6, [ 'IdentifierExpr' ]
    $P6.'IdentifierExpr'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_11: # endif
.annotate 'line', 5888
    'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 5889

.end # parseExpr_0


.sub 'parseExpr_2'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5893
.const 'Sub' $P5 = 'parseExpr_0'
.annotate 'line', 5894
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 5896
# var subexp: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5897
# var t: $P2
    null $P2
.annotate 'line', 5898
# var start: $P3
    null $P3
.annotate 'line', 5899
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 5900
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 5901
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
.annotate 'line', 5903
    new $P8, [ 'CallExpr' ]
    $P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P8
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5906
    new $P9, [ 'IndexExpr' ]
    $P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P9
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 5909
    set $P3, $P2
.annotate 'line', 5910
    $P2 = __ARG_1.'get'()
.annotate 'line', 5911
    $P10 = $P2.'isop'('*')
    if_null $P10, __label_7
    unless $P10 goto __label_7
# {
.annotate 'line', 5912
# var right: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5913
    new $P7, [ 'MemberRefExpr' ]
    $P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P7
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5916
    new $P7, [ 'MemberExpr' ]
    $P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
 __label_8: # endif
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5919
    'InternalError'('Unexpected code in parseExpr_2')
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 5922
    __ARG_1.'unget'($P2)
.annotate 'line', 5923
    .return($P1)
# }
.annotate 'line', 5924

.end # parseExpr_2


.sub 'parseExpr_3'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5928
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 5930
# var subexp: $P1
    $P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 5931
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5932
    $P4 = $P2.'isop'('++')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 5933
    new $P5, [ 'OpPostIncExpr' ]
    .tailcall $P5.'set'(__ARG_2, $P2, $P1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5934
    $P6 = $P2.'isop'('--')
    if_null $P6, __label_2
    unless $P6 goto __label_2
.annotate 'line', 5935
    new $P7, [ 'OpPostDecExpr' ]
    .tailcall $P7.'set'(__ARG_2, $P2, $P1)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 5938
    __ARG_1.'unget'($P2)
.annotate 'line', 5939
    .return($P1)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5941

.end # parseExpr_3


.sub 'parseExpr_4'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5945
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 5946
.const 'Sub' $P5 = 'parseExpr_3'
.annotate 'line', 5947
.const 'Sub' $P6 = 'getOpCode_4'
.annotate 'line', 5949
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5950
# code: $I1
    $P7 = $P6($P1)
    set $I1, $P7
.annotate 'line', 5951
# var subexpr: $P2
    null $P2
.annotate 'line', 5952
    eq $I1, 0, __label_0
# {
.annotate 'line', 5953
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 5954
# var oper: $P3
    null $P3
.annotate 'line', 5955
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
.annotate 'line', 5957
    new $P3, [ 'OpUnaryMinusExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5960
    new $P3, [ 'OpNotExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 5963
    new $P3, [ 'OpPreIncExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 5966
    new $P3, [ 'OpPreDecExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 5969
    new $P3, [ 'OpDeleteExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 5972
    new $P3, [ 'OpExistsExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5975
    'InternalError'('Invalid code in parseExpr_4', $P1)
 __label_2: # switch end
.annotate 'line', 5977
    $P2 = $P3.'set'(__ARG_2, $P1, $P2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5980
    __ARG_1.'unget'($P1)
.annotate 'line', 5981
    $P2 = $P5(__ARG_1, __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 5983
    .return($P2)
# }
.annotate 'line', 5984

.end # parseExpr_4


.sub 'parseExpr_5'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5988
.const 'Sub' $P5 = 'parseExpr_4'
.annotate 'line', 5989
.const 'Sub' $P6 = 'getOpCode_5'
.annotate 'line', 5991
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5992
# var t: $P2
    null $P2
.annotate 'line', 5993
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 5994
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 5995
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 5996
# var aux: $P4
    null $P4
.annotate 'line', 5997
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
.annotate 'line', 5999
    new $P4, [ 'OpMulExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6002
    new $P4, [ 'OpDivExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6005
    new $P4, [ 'OpModExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6008
    new $P4, [ 'OpCModExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6011
    'InternalError'('Invalid code in parseExpr_5', $P2)
 __label_2: # switch end
.annotate 'line', 6013
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6014
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6016
    __ARG_1.'unget'($P2)
.annotate 'line', 6017
    .return($P1)
# }
.annotate 'line', 6018

.end # parseExpr_5


.sub 'parseExpr_6'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6022
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6024
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6025
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6026
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6027
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6028
# var expr: $P4
    null $P4
.annotate 'line', 6029
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6030
    new $P7, [ 'OpAddExpr' ]
    $P4 = $P7.'set'(__ARG_2, $P2, $P1, $P3)
    goto __label_4
 __label_3: # else
.annotate 'line', 6032
    new $P8, [ 'OpSubExpr' ]
    $P4 = $P8.'set'(__ARG_2, $P2, $P1, $P3)
 __label_4: # endif
.annotate 'line', 6033
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6035
    __ARG_1.'unget'($P2)
.annotate 'line', 6036
    .return($P1)
# }
.annotate 'line', 6037

.end # parseExpr_6


.sub 'parseExpr_7'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6041
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6043
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6044
# var rexpr: $P2
    null $P2
.annotate 'line', 6045
# var t: $P3
    null $P3
.annotate 'line', 6046
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6047
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
.annotate 'line', 6048
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6050
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6051
    new $P6, [ 'OpShiftleftExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6054
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6055
    new $P7, [ 'OpShiftrightExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6058
    'InternalError'('Invalid code in parseExpr_7', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6061
    __ARG_1.'unget'($P3)
.annotate 'line', 6062
    .return($P1)
# }
.annotate 'line', 6063

.end # parseExpr_7


.sub 'parseExpr_8'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6067
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 6068
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6070
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6071
# var rexpr: $P2
    null $P2
.annotate 'line', 6072
# var t: $P3
    null $P3
.annotate 'line', 6073
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6074
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6075
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
.annotate 'line', 6077
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6078
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6081
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6082
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6085
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6086
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6089
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6090
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6093
    new $P11, [ 'OpInstanceOfExpr' ]
    $P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6096
    'InternalError'('Invalid code in parseExpr_9', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6099
    __ARG_1.'unget'($P3)
.annotate 'line', 6100
    .return($P1)
# }
.annotate 'line', 6101

.end # parseExpr_8


.sub 'parseExpr_9'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6105
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 6106
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6108
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6109
# var rexpr: $P2
    null $P2
.annotate 'line', 6110
# var t: $P3
    null $P3
.annotate 'line', 6111
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6112
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6113
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
.annotate 'line', 6115
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6116
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6119
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6120
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6123
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6124
    new $P9, [ 'OpSameExpr' ]
    $P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6127
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6128
    new $P10, [ 'OpSameExpr' ]
    $P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6131
    'InternalError'('Invalid code in parseExpr_8', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6134
    __ARG_1.'unget'($P3)
.annotate 'line', 6135
    .return($P1)
# }
.annotate 'line', 6136

.end # parseExpr_9


.sub 'parseExpr_10'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6140
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6142
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6143
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6144
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6145
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6146
    new $P5, [ 'OpBinAndExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6148
    __ARG_1.'unget'($P2)
.annotate 'line', 6149
    .return($P1)
# }
.annotate 'line', 6150

.end # parseExpr_10


.sub 'parseExpr_11'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6154
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6156
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6157
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6158
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6159
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6160
    new $P5, [ 'OpBinXorExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6162
    __ARG_1.'unget'($P2)
.annotate 'line', 6163
    .return($P1)
# }
.annotate 'line', 6164

.end # parseExpr_11


.sub 'parseExpr_12'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6168
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6170
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6171
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6172
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6173
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6174
    new $P5, [ 'OpBinOrExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6176
    __ARG_1.'unget'($P2)
.annotate 'line', 6177
    .return($P1)
# }
.annotate 'line', 6178

.end # parseExpr_12


.sub 'parseExpr_13'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6182
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6184
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6185
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6186
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6187
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6188
    new $P5, [ 'OpBoolAndExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6190
    __ARG_1.'unget'($P2)
.annotate 'line', 6191
    .return($P1)
# }
.annotate 'line', 6192

.end # parseExpr_13


.sub 'parseExpr_14'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6196
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6198
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6199
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6200
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6201
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6202
    new $P5, [ 'OpBoolOrExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P2, $P1, $P3)
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6204
    __ARG_1.'unget'($P2)
.annotate 'line', 6205
    .return($P1)
# }
.annotate 'line', 6206

.end # parseExpr_14


.sub 'parseExpr_15'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6210
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6211
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6213
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6214
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6215
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6216
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6217
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6218
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6219
    new $P7, [ 'OpConditionalExpr' ]
    .tailcall $P7.'set'(__ARG_2, $P2, $P1, $P3, $P4)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6222
    __ARG_1.'unget'($P2)
.annotate 'line', 6223
    .return($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6225

.end # parseExpr_15


.sub 'parseExpr_16'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6229
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6230
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 6231
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6233
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6234
# var t: $P2
    null $P2
.annotate 'line', 6235
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6236
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6237
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6238
# var expr: $P4
    null $P4
.annotate 'line', 6239
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
.annotate 'line', 6241
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6244
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6247
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6250
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6253
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 6256
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
 __label_10: # case
.annotate 'line', 6259
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6262
    'InternalError'('Unexpected code in parseExpr_16', $P2)
 __label_2: # switch end
.annotate 'line', 6264
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6265
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6267
    __ARG_1.'unget'($P2)
.annotate 'line', 6268
    .return($P1)
# }
.annotate 'line', 6269

.end # parseExpr_16


.sub 'parseExpr'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6273
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6275
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6276

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6291
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6292
    'InternalError'('attempt to generate break label twice')
 __label_0: # endif
.annotate 'line', 6293
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6294
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6295
    .return($S1)
# }
.annotate 'line', 6296

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6299
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6300
    unless_null $P1, __label_0
.annotate 'line', 6301
    'InternalError'('attempt to get break label before creating it')
 __label_0: # endif
.annotate 'line', 6302
    .return($P1)
# }
.annotate 'line', 6303

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6287
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6312
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6313
    'InternalError'('attempt to generate continue label twice')
 __label_0: # endif
.annotate 'line', 6314
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6315
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6316
    .return($S1)
# }
.annotate 'line', 6317

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6320
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6321
    unless_null $P1, __label_0
.annotate 'line', 6322
    'InternalError'('attempt to get continue label before creating it')
 __label_0: # endif
.annotate 'line', 6323
    .return($P1)
# }
.annotate 'line', 6324

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6306
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6308
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6340
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6341
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6342
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6343
    __ARG_2.'unget'($P1)
.annotate 'line', 6344
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 6346

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6349
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6350
    if_null $P1, __label_0
.annotate 'line', 6351
    $P1 = $P1.'optimize'()
 __label_0: # endif
.annotate 'line', 6352
    .return(self)
# }
.annotate 'line', 6353

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6357
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6358
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
 __label_0:
.annotate 'line', 6361
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, [ 'ReturnStatement' ]
 __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6362
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6363
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6364
    self.'annotate'(__ARG_1)
.annotate 'line', 6365
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 6369
    le $I1, 0, __label_5
.annotate 'line', 6370
    $P1.'getargvalues'(__ARG_1)
 __label_5: # endif
.annotate 'line', 6372
    self.'annotate'(__ARG_1)
.annotate 'line', 6373
    self.'emitret'(__ARG_1)
.annotate 'line', 6374
    le $I1, 0, __label_6
.annotate 'line', 6375
    $P1.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6376
    __ARG_1.'say'(')')
# }
.annotate 'line', 6377

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6334
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6336
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6384
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6385

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6388
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6389

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6380
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
.annotate 'line', 6396
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6397

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6400
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6401

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6392
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6414
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6415
    setattribute self, 'name', __ARG_1
.annotate 'line', 6416
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6417
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6418

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6419
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6422
    self.'annotate'(__ARG_1)
.annotate 'line', 6423
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6424
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6425
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6426

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6408
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6410
    addattribute $P0, 'name'
.annotate 'line', 6411
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6440
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6441
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6442

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6443
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6446
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6447
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6448
    .return($S2)
# }
.annotate 'line', 6449

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6435
    addattribute $P0, 'owner'
.annotate 'line', 6436
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6462
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6463
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6464
    'RequireIdentifier'($P1)
.annotate 'line', 6465
    setattribute self, 'label', $P1
.annotate 'line', 6466
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6467

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6468
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6471
    self.'annotate'(__ARG_1)
.annotate 'line', 6472
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6473
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6474
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6475

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6456
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6458
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6486
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6487

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6490
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6491
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6492
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6493

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6482
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
.annotate 'line', 6506
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6507
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6508
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6509
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6510
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6511
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6513
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6514
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6516

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6519
    self.'optimize_condition'()
.annotate 'line', 6520
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6521
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6522
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 6523
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6525
    getattribute $P1, self, 'truebranch'
    .return($P1)
 __label_3: # case
.annotate 'line', 6527
    getattribute $P2, self, 'falsebranch'
    .return($P2)
 __label_1: # default
 __label_0: # switch end
.annotate 'line', 6529
    .return(self)
# }
.annotate 'line', 6530

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6533
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6534
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6535
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6536
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6537
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6538
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6539
    $P3 = self.'genlabel'()
    set $S1, $P3
 __label_0: # endif
.annotate 'line', 6540
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 6541
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
 __label_3:
    set $S3, $S1
 __label_2:
.annotate 'line', 6542
    self.'annotate'(__ARG_1)
.annotate 'line', 6543
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6544
    $P1.'emit'(__ARG_1)
.annotate 'line', 6546
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6547
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6548
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6549
    $P2.'emit'(__ARG_1)
# }
 __label_4: # endif
.annotate 'line', 6551
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6552

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6500
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6502
    addattribute $P0, 'truebranch'
.annotate 'line', 6503
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6564
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6565

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6568
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6569
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6571
    self.'annotate'(__ARG_1)
.annotate 'line', 6572
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6573
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6574
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6575
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6576

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6559
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6561
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6587
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6588
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6589
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6590

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6593
    self.'optimize_condition'()
.annotate 'line', 6594
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6595
    .return(self)
# }
.annotate 'line', 6596

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6599
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6601
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 6604
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6607
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
 __label_4:
.annotate 'line', 6608
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 6610
    self.'annotate'(__ARG_1)
.annotate 'line', 6611
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6612
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6613
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6614
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6615
    __ARG_1.'emitlabel'($S1, 'endwhile')
 __label_0: # switch end
# }
.annotate 'line', 6617

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6583
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
.annotate 'line', 6628
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6629
    self.'parsebody'(__ARG_2)
.annotate 'line', 6630
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6631
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6632

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6635
    self.'optimize_condition'()
.annotate 'line', 6636
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6637
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6638
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
 __label_0: # endif
.annotate 'line', 6639
    setattribute self, 'body', $P1
.annotate 'line', 6640
    .return(self)
# }
.annotate 'line', 6641

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6644
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6645
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 6646
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6648
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6651
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 6652
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
 __label_4:
.annotate 'line', 6653
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
 __label_5:
.annotate 'line', 6655
    self.'annotate'(__ARG_1)
.annotate 'line', 6656
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6658
    $P1.'emit'(__ARG_1)
.annotate 'line', 6659
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6660
    eq $I1, 2, __label_6
.annotate 'line', 6661
    self.'emit_if'(__ARG_1, $S1, $S2)
 __label_6: # endif
.annotate 'line', 6662
    __ARG_1.'emitlabel'($S2, 'enddo')
 __label_0: # switch end
# }
.annotate 'line', 6664

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6624
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
.annotate 'line', 6675
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6676
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6677

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6678
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6681
    self.'annotate'(__ARG_1)
.annotate 'line', 6682
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6683
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6684

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6671
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
.annotate 'line', 6695
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6696
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6697

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6698
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6701
    self.'annotate'(__ARG_1)
.annotate 'line', 6702
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6703
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6704

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6691
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
.annotate 'line', 6720
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6721
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6722
    $P3 = $P1.'isop'('(')
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 6723
    'Expected'("'(' in switch", $P1)
 __label_0: # endif
.annotate 'line', 6724
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P4
.annotate 'line', 6725
    $P1 = __ARG_2.'get'()
.annotate 'line', 6726
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 6727
    'Expected'("')' in switch", $P1)
 __label_1: # endif
.annotate 'line', 6728
    $P1 = __ARG_2.'get'()
.annotate 'line', 6729
    $P3 = $P1.'isop'('{')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 6730
    'Expected'("'{' in switch", $P1)
 __label_2: # endif
.annotate 'line', 6731
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P4
.annotate 'line', 6732
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P4
.annotate 'line', 6733
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P4
 __label_4: # while
.annotate 'line', 6734
    $P1 = __ARG_2.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_5
    $I1 = $P1.'iskeyword'('default')
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 6735
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 6736
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_2, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6737
    $P1 = __ARG_2.'get'()
.annotate 'line', 6738
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_8
.annotate 'line', 6739
    'Expected'("':' in case", $P1)
 __label_8: # endif
.annotate 'line', 6740
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_10: # while
.annotate 'line', 6741
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
.annotate 'line', 6742
    __ARG_2.'unget'($P1)
.annotate 'line', 6743
    $P3 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P2, $P3
# }
    goto __label_10
 __label_9: # endwhile
.annotate 'line', 6745
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6746
    __ARG_2.'unget'($P1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 6749
    $P1 = __ARG_2.'get'()
.annotate 'line', 6750
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_13
.annotate 'line', 6751
    'Expected'("':' in default", $P1)
 __label_13: # endif
 __label_15: # while
.annotate 'line', 6752
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
.annotate 'line', 6753
    __ARG_2.'unget'($P1)
.annotate 'line', 6754
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P3, $P4
# }
    goto __label_15
 __label_14: # endwhile
.annotate 'line', 6756
    __ARG_2.'unget'($P1)
# }
 __label_7: # endif
# }
    goto __label_4
 __label_3: # endwhile
# }
.annotate 'line', 6759

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6762
    getattribute $P4, self, 'condition'
    $P3 = $P4.'optimize'()
    setattribute self, 'condition', $P3
.annotate 'line', 6763
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6764
    getattribute $P2, self, 'case_st'
    iter $P5, $P2
    set $P5, 0
 __label_0: # for iteration
    unless $P5 goto __label_1
    shift $P1, $P5
.annotate 'line', 6765
    'optimize_array'($P1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6766
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
.annotate 'line', 6767
    .return(self)
# }
.annotate 'line', 6768

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6772
# type: $S1
    set $S1, ''
.annotate 'line', 6773
    getattribute $P10, self, 'case_value'
    iter $P11, $P10
    set $P11, 0
 __label_0: # for iteration
    unless $P11 goto __label_1
    shift $P1, $P11
# {
.annotate 'line', 6774
# t: $S2
    $P12 = $P1.'checkresult'()
    null $S2
    if_null $P12, __label_2
    set $S2, $P12
 __label_2:
.annotate 'line', 6775
    ne $S2, 'N', __label_3
.annotate 'line', 6776
    getattribute $P10, self, 'start'
    'SyntaxError'("Invalid type in case", $P10)
 __label_3: # endif
.annotate 'line', 6777
    ne $S1, '', __label_4
.annotate 'line', 6778
    set $S1, $S2
    goto __label_5
 __label_4: # else
.annotate 'line', 6779
    eq $S1, $S2, __label_6
.annotate 'line', 6780
    set $S1, 'P'
 __label_6: # endif
 __label_5: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6783
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 6784
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 6788
    ne $S1, '', __label_7
.annotate 'line', 6789
    set $S1, $P3
 __label_7: # endif
.annotate 'line', 6791
# reg: $S3
    $P10 = self.'tempreg'($S1)
    null $S3
    if_null $P10, __label_8
    set $S3, $P10
 __label_8:
.annotate 'line', 6792
    set $S9, $P3
    ne $S9, $S1, __label_9
.annotate 'line', 6793
    $P2.'emit'(__ARG_1, $S3)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 6795
# regcond: $S4
    $P10 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_11
    set $S4, $P10
 __label_11:
.annotate 'line', 6796
    __ARG_1.'emitset'($S3, $S4)
# }
 __label_10: # endif
.annotate 'line', 6800
    self.'genbreaklabel'()
.annotate 'line', 6801
# defaultlabel: $S5
    $P10 = self.'genlabel'()
    null $S5
    if_null $P10, __label_12
    set $S5, $P10
 __label_12:
.annotate 'line', 6802
    new $P4, ['ResizableStringArray']
.annotate 'line', 6803
# regval: $S6
    $P10 = self.'tempreg'($S1)
    null $S6
    if_null $P10, __label_13
    set $S6, $P10
 __label_13:
.annotate 'line', 6804
    getattribute $P10, self, 'case_value'
    iter $P13, $P10
    set $P13, 0
 __label_14: # for iteration
    unless $P13 goto __label_15
    shift $P5, $P13
# {
.annotate 'line', 6805
# label: $S7
    $P12 = self.'genlabel'()
    null $S7
    if_null $P12, __label_16
    set $S7, $P12
 __label_16:
.annotate 'line', 6806
# predefined push
    push $P4, $S7
.annotate 'line', 6807
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 6808
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_14
 __label_15: # endfor
.annotate 'line', 6810
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6813
    __ARG_1.'comment'('switch')
.annotate 'line', 6814
    self.'annotate'(__ARG_1)
.annotate 'line', 6815
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 6816
# n: $I1
    set $P10, $P6
    set $I1, $P10
# for loop
.annotate 'line', 6817
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 6818
# l: $S8
    $S8 = $P4[$I2]
.annotate 'line', 6819
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6820
# var casest: $P7
    $P7 = $P6[$I2]
.annotate 'line', 6821
    iter $P14, $P7
    set $P14, 0
 __label_20: # for iteration
    unless $P14 goto __label_21
    shift $P8, $P14
.annotate 'line', 6822
    $P8.'emit'(__ARG_1)
    goto __label_20
 __label_21: # endfor
# }
 __label_17: # for iteration
.annotate 'line', 6817
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 6825
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6826
    getattribute $P10, self, 'default_st'
    iter $P15, $P10
    set $P15, 0
 __label_22: # for iteration
    unless $P15 goto __label_23
    shift $P9, $P15
.annotate 'line', 6827
    $P9.'emit'(__ARG_1)
    goto __label_22
 __label_23: # endfor
.annotate 'line', 6829
    getattribute $P12, self, 'start'
    $P10 = self.'getbreaklabel'($P12)
    __ARG_1.'emitlabel'($P10, 'switch end')
# }
.annotate 'line', 6830

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6711
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6713
    addattribute $P0, 'condition'
.annotate 'line', 6714
    addattribute $P0, 'case_value'
.annotate 'line', 6715
    addattribute $P0, 'case_st'
.annotate 'line', 6716
    addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6844
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6845
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6846
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6847
    __ARG_2.'unget'($P1)
.annotate 'line', 6848
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
 __label_0: # endif
.annotate 'line', 6850
    $P1 = __ARG_2.'get'()
.annotate 'line', 6851
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6852
    __ARG_2.'unget'($P1)
.annotate 'line', 6853
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6854
    'ExpectOp'(';', __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 6856
    $P1 = __ARG_2.'get'()
.annotate 'line', 6857
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 6858
    __ARG_2.'unget'($P1)
.annotate 'line', 6859
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 6860
    'ExpectOp'(')', __ARG_2)
# }
 __label_2: # endif
.annotate 'line', 6862
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6863

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6866
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 6867
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
 __label_0: # endif
.annotate 'line', 6868
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 6869
    self.'optimize_condition'()
 __label_1: # endif
.annotate 'line', 6870
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 6871
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
 __label_2: # endif
.annotate 'line', 6872
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6873
    .return(self)
# }
.annotate 'line', 6874

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6877
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 6878
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6879
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 6880
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 6881
    .return()
# }
 __label_0: # endif
.annotate 'line', 6883
    __ARG_1.'comment'('for loop')
.annotate 'line', 6884
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
 __label_3:
.annotate 'line', 6885
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
 __label_4:
.annotate 'line', 6886
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
 __label_5:
.annotate 'line', 6887
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 6888
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6890
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 6891
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 6892
    self.'emit_else'(__ARG_1, $S2)
 __label_7: # endif
.annotate 'line', 6894
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6895
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 6896
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 6897
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
 __label_8: # endif
.annotate 'line', 6898
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 6900
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 6901

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6837
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 6839
    addattribute $P0, 'initializer'
.annotate 'line', 6840
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
.annotate 'line', 6916
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6917
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6918
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 6919
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 6920
    self.'createvar'($S1, $S2)
.annotate 'line', 6921
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
 __label_1: # endif
.annotate 'line', 6923
    setattribute self, 'varname', __ARG_4
.annotate 'line', 6924
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 6925
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 6926
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6927

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6930
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 6931
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6932
    .return(self)
# }
.annotate 'line', 6933

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6936
    self.'annotate'(__ARG_1)
.annotate 'line', 6937
# regcont: $S1
    null $S1
.annotate 'line', 6938
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 6939
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 6940
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6941
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 6944
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 6945
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 6946
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 6947
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
 __label_4:
.annotate 'line', 6948
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
 __label_5:
.annotate 'line', 6949
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 6950
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 6951
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 6952
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 6953
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 6954
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 6955
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 6956
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 6957

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 6908
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 6910
    addattribute $P0, 'deftype'
.annotate 'line', 6911
    addattribute $P0, 'varname'
.annotate 'line', 6912
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6964
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 6965
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6966
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 6967
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 6968
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6970
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 6971
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 6972
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 6973
    __ARG_2.'unget'($P3)
.annotate 'line', 6974
    __ARG_2.'unget'($P2)
.annotate 'line', 6975
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
.annotate 'line', 6977
    new $P5, [ 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 6978

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6990
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6991
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 6992

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6995
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 6996
    .return(self)
# }
.annotate 'line', 6997

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7000
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7001
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7002
    self.'annotate'(__ARG_1)
.annotate 'line', 7003
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 7005
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_1 # break
 __label_4: # case
.annotate 'line', 7008
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_1 # break
 __label_2: # default
.annotate 'line', 7011
    getattribute $P3, self, 'start'
    'SyntaxError'("Invalid throw argument", $P3)
 __label_1: # switch end
# }
.annotate 'line', 7013

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 6984
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6986
    addattribute $P0, 'excep'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7029
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7030
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7031
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7032
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_1
 __label_0: # else
.annotate 'line', 7034
    __ARG_2.'unget'($P1)
 __label_1: # endif
.annotate 'line', 7036
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7037
    $P1 = __ARG_2.'get'()
.annotate 'line', 7038
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7039
    'ExpectedOp'('catch', $P1)
 __label_2: # endif
.annotate 'line', 7040
    $P1 = __ARG_2.'get'()
.annotate 'line', 7041
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7042
    'Expected'("'(' after 'catch'", $P1)
 __label_3: # endif
.annotate 'line', 7043
    $P1 = __ARG_2.'get'()
.annotate 'line', 7044
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 7045
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
 __label_5:
.annotate 'line', 7046
    setattribute self, 'exname', $P1
.annotate 'line', 7047
    self.'createvar'($S1, 'P')
.annotate 'line', 7048
    $P1 = __ARG_2.'get'()
.annotate 'line', 7049
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 7050
    'Expected'("')' in 'catch'", $P1)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 7052
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7053

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7056
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 7057
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
 __label_0: # endif
.annotate 'line', 7058
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7059
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7060
    .return(self)
# }
.annotate 'line', 7061

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7064
# reghandler: $S1
    $P7 = self.'tempreg'('P')
    null $S1
    if_null $P7, __label_0
    set $S1, $P7
 __label_0:
.annotate 'line', 7065
# labelhandler: $S2
    $P7 = self.'genlabel'()
    null $S2
    if_null $P7, __label_1
    set $S2, $P7
 __label_1:
.annotate 'line', 7066
# labelpasthandler: $S3
    $P7 = self.'genlabel'()
    null $S3
    if_null $P7, __label_2
    set $S3, $P7
 __label_2:
.annotate 'line', 7067
# exreg: $S4
    null $S4
.annotate 'line', 7068
    getattribute $P7, self, 'exname'
    if_null $P7, __label_3
# {
.annotate 'line', 7069
# var exname: $P1
    getattribute $P8, self, 'exname'
    $P1 = self.'getvar'($P8)
.annotate 'line', 7070
    $P7 = $P1.'getreg'()
    set $S4, $P7
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 7073
    $P7 = self.'tempreg'('P')
    set $S4, $P7
 __label_4: # endif
.annotate 'line', 7075
    self.'annotate'(__ARG_1)
.annotate 'line', 7076
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7078
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7079
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7081
    getattribute $P7, self, 'modifiers'
    if_null $P7, __label_5
# {
.annotate 'line', 7082
# var modiflist: $P2
    getattribute $P8, self, 'modifiers'
    $P2 = $P8.'getlist'()
.annotate 'line', 7083
    iter $P9, $P2
    set $P9, 0
 __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P3, $P9
# {
.annotate 'line', 7084
# modifname: $S5
    $P7 = $P3.'getname'()
    null $S5
    if_null $P7, __label_8
    set $S5, $P7
 __label_8:
.annotate 'line', 7085
# nargs: $I1
    $P7 = $P3.'numargs'()
    set $I1, $P7
.annotate 'line', 7086
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
.annotate 'line', 7089
    eq $I1, 1, __label_15
.annotate 'line', 7090
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
 __label_15: # endif
.annotate 'line', 7091
# var arg: $P4
    $P4 = $P3.'getarg'(0)
.annotate 'line', 7092
# argreg: $S6
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S6
    if_null $P8, __label_16
    set $S6, $P8
 __label_16:
.annotate 'line', 7093
    __ARG_1.'say'('    ', $S1, ".'", $S5, "'(", $S6, ")")
    goto __label_9 # break
 __label_13: # case
 __label_14: # case
.annotate 'line', 7097
    new $P5, ['ResizableStringArray']
# for loop
.annotate 'line', 7098
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 7099
# var arg: $P6
    $P6 = $P3.'getarg'($I2)
.annotate 'line', 7100
    $P7 = $P6.'emit_get'(__ARG_1)
# predefined push
    push $P5, $P7
# }
 __label_17: # for iteration
.annotate 'line', 7098
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 7103
# predefined join
    join $S7, ', ', $P5
.annotate 'line', 7102
    __ARG_1.'say'('    ', $S1, ".'", $S5, "'(", $S7, ")")
    goto __label_9 # break
 __label_10: # default
.annotate 'line', 7106
    getattribute $P7, self, 'start'
    'SyntaxError'('Unexpected modifier in try', $P7)
 __label_9: # switch end
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 7111
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7112
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7113
    getattribute $P7, self, 'stry'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7114
    __ARG_1.'comment'('try: end')
.annotate 'line', 7115
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7117
    self.'annotate'(__ARG_1)
.annotate 'line', 7118
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7120
    __ARG_1.'comment'('catch')
.annotate 'line', 7121
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7122
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7123
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7124
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7125
    getattribute $P7, self, 'scatch'
    $P7.'emit'(__ARG_1)
.annotate 'line', 7127
    __ARG_1.'comment'('catch end')
.annotate 'line', 7128
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7129

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7020
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7022
    addattribute $P0, 'stry'
.annotate 'line', 7023
    addattribute $P0, 'modifiers'
.annotate 'line', 7024
    addattribute $P0, 'exname'
.annotate 'line', 7025
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
.annotate 'line', 7142
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7143
    setattribute self, 'name', __ARG_3
.annotate 'line', 7144
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7145
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7146

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7136
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7138
    addattribute $P0, 'name'
.annotate 'line', 7139
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
.annotate 'line', 7161
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7162
    setattribute self, 'name', __ARG_3
.annotate 'line', 7163
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7164

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7153
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7155
    addattribute $P0, 'name'
.annotate 'line', 7156
    addattribute $P0, 'basetype'
.annotate 'line', 7157
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
.annotate 'line', 7175
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7176
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7177
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7178
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7179
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7181
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7184
    __ARG_5.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 7185

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7188
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7189
    if_null $P1, __label_0
.annotate 'line', 7190
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7191
    .return(self)
# }
.annotate 'line', 7192

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7195
    self.'annotate'(__ARG_1)
.annotate 'line', 7196
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7197
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7198
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7199
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7200
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7202
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7203
    __ARG_1.'emitnull'($S2)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7205
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
 __label_6:
.annotate 'line', 7206
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7207
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, [ 'ConcatString' ]
 __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7208
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
.annotate 'line', 7210
    $P1.'emit'(__ARG_1, $S2)
 __label_10: # endif
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7213
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_12
# {
.annotate 'line', 7215
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 7218
# ireg: $S5
    null $S5
.annotate 'line', 7219
    ne $S4, '', __label_14
.annotate 'line', 7220
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
 __label_14: # else
# {
.annotate 'line', 7222
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7223
    $P1.'emit'(__ARG_1, $S5)
# }
 __label_15: # endif
.annotate 'line', 7225
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
 __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7226
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
 __label_19:
.annotate 'line', 7227
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7228
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7229
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7230
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
 __label_16: # else
.annotate 'line', 7233
    __ARG_1.'emitset'($S2, $S5)
 __label_17: # endif
# }
 __label_13: # endif
# }
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 7237

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7169
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7171
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
.annotate 'line', 7252
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7253
    box $P4, __ARG_5
    setattribute self, 'arraytype', $P4
.annotate 'line', 7254
# var vdata: $P1
    getattribute $P4, self, 'name'
    $P1 = self.'createvar'($P4, 'P')
.annotate 'line', 7255
    $P5 = $P1.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 7256
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7257
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_0
# {
.annotate 'line', 7259
    __ARG_6.'unget'($P2)
.annotate 'line', 7260
    $P5 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P5
.annotate 'line', 7261
    'ExpectOp'(']', __ARG_6)
# }
 __label_0: # endif
.annotate 'line', 7263
    $P2 = __ARG_6.'get'()
.annotate 'line', 7264
    $P4 = $P2.'isop'('=')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7265
    $P2 = __ARG_6.'get'()
.annotate 'line', 7266
    $P4 = $P2.'isop'('[')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 7267
    'Expected'("array initializer", $P2)
 __label_3: # endif
.annotate 'line', 7268
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P5
.annotate 'line', 7269
    $P2 = __ARG_6.'get'()
.annotate 'line', 7270
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_4
# {
.annotate 'line', 7271
    __ARG_6.'unget'($P2)
 __label_5: # do
.annotate 'line', 7272
# {
.annotate 'line', 7273
# var item: $P3
    $P3 = 'parseExpr'(__ARG_6, self)
.annotate 'line', 7274
    getattribute $P4, self, 'initarray'
# predefined push
    push $P4, $P3
# }
 __label_7: # continue
.annotate 'line', 7275
    $P2 = __ARG_6.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 7276
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_8
.annotate 'line', 7277
    'Expected'("',' or ']'", $P2)
 __label_8: # endif
# }
 __label_4: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 7281
    __ARG_6.'unget'($P2)
 __label_2: # endif
# }
.annotate 'line', 7282

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7285
    getattribute $P1, self, 'size'
    if_null $P1, __label_0
.annotate 'line', 7286
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
 __label_0: # endif
.annotate 'line', 7287
    getattribute $P1, self, 'initarray'
    'optimize_array'($P1)
.annotate 'line', 7288
    .return(self)
# }
.annotate 'line', 7289

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7292
    self.'annotate'(__ARG_1)
.annotate 'line', 7294
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7295
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7296
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7297
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7298
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7299
    if_null $P2, __label_0
# {
.annotate 'line', 7301
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
 __label_2:
.annotate 'line', 7302
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7306
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
 __label_1: # endif
.annotate 'line', 7308
    if_null $P3, __label_3
# {
.annotate 'line', 7309
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
 __label_4:
.annotate 'line', 7310
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7311
    unless_null $P2, __label_5
# {
.annotate 'line', 7312
    le $I1, 0, __label_6
# {
.annotate 'line', 7314
    __ARG_1.'emitset'($P1, $I1)
# }
 __label_6: # endif
# }
 __label_5: # endif
.annotate 'line', 7317
# i: $I2
    null $I2
.annotate 'line', 7318
    iter $P7, $P3
    set $P7, 0
 __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7319
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7320
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7321
    inc $I2
# }
    goto __label_7
 __label_8: # endfor
# }
 __label_3: # endif
# }
.annotate 'line', 7324

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7242
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7244
    addattribute $P0, 'size'
.annotate 'line', 7245
    addattribute $P0, 'initarray'
.annotate 'line', 7246
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
.annotate 'line', 7331
# var next: $P1
    null $P1
.annotate 'line', 7332
# var r: $P2
    null $P2
 __label_0: # do
.annotate 'line', 7333
# {
.annotate 'line', 7334
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7335
    'RequireIdentifier'($P3)
.annotate 'line', 7336
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7337
# var item: $P5
    null $P5
.annotate 'line', 7338
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7339
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7341
    __ARG_4.'unget'($P4)
.annotate 'line', 7342
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
 __label_4: # endif
.annotate 'line', 7344
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7345
    $P1 = __ARG_4.'get'()
# }
 __label_2: # continue
.annotate 'line', 7346
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
 __label_1: # enddo
.annotate 'line', 7347
    'RequireOp'(';', $P1)
.annotate 'line', 7348
    .return($P2)
# }
.annotate 'line', 7349

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7357
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7358

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7353
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
.annotate 'line', 7365
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7366

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7361
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
.annotate 'line', 7372
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7373

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7377
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7378

.end # newIntArray


.sub 'parseInt'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7382
.const 'Sub' $P1 = 'newIntSingle'
.annotate 'line', 7383
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7384
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7385

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7393
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7394

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7389
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
.annotate 'line', 7401
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7402

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7397
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
.annotate 'line', 7408
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7409

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7413
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7414

.end # newFloatArray


.sub 'parseFloat'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7418
.const 'Sub' $P1 = 'newFloatSingle'
.annotate 'line', 7419
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7420
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7421

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7429
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7430

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7425
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
.annotate 'line', 7437
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7438

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7433
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
.annotate 'line', 7444
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7445

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7449
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7450

.end # newStringArray


.sub 'parseString'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7454
.const 'Sub' $P1 = 'newStringSingle'
.annotate 'line', 7455
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7456
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7457

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
.annotate 'line', 7472
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7473
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7474
    setattribute self, 'name', __ARG_4
.annotate 'line', 7475
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7476

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7479
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7480
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7481
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 7482
    $P1 = $P1.'optimize'()
.annotate 'line', 7483
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7485
    getattribute $P4, self, 'start'
.annotate 'line', 7484
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
 __label_1: # endif
.annotate 'line', 7487
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7488
    setattribute self, 'value', $P1
.annotate 'line', 7489
    .return(self)
# }
.annotate 'line', 7490

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 7493
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7494

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7497
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7498
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7499

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7463
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7465
    addattribute $P0, 'type'
.annotate 'line', 7466
    addattribute $P0, 'name'
.annotate 'line', 7467
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7504
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7505
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 7506
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
 __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7507
    'SyntaxError'('Invalid type for const', __ARG_1)
 __label_1: # endif
.annotate 'line', 7509
# var multi: $P2
    null $P2
 __label_4: # do
.annotate 'line', 7510
# {
.annotate 'line', 7511
    $P1 = __ARG_2.'get'()
.annotate 'line', 7512
# var name: $P3
    set $P3, $P1
.annotate 'line', 7513
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7514
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7516
    new $P6, [ 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7515
    $P2 = 'addtomulti'($P2, $P5)
# }
 __label_6: # continue
.annotate 'line', 7517
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
 __label_5: # enddo
.annotate 'line', 7518
    .return($P2)
# }
.annotate 'line', 7519

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
.annotate 'line', 7530
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7531
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7532
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7533
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7534
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 7536
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7537

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7540
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7541
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7542
    .return(self)
# }
.annotate 'line', 7543

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7546
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7547

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7550
    self.'annotate'(__ARG_1)
.annotate 'line', 7551
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7552
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7553
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7554
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7555
    if_null $P1, __label_2
.annotate 'line', 7556
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7557
    null $P1
 __label_3: # endif
 __label_2: # endif
.annotate 'line', 7558
    if_null $P1, __label_4
# {
.annotate 'line', 7559
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 7560
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
.annotate 'line', 7562
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
 __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
 __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7563
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
 __label_14: # else
.annotate 'line', 7565
    $P1.'emit'(__ARG_1, $S2)
 __label_15: # endif
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
 __label_12: # case
.annotate 'line', 7570
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
 __label_18:
.annotate 'line', 7571
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
 __label_13: # case
.annotate 'line', 7574
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
 __label_8: # default
.annotate 'line', 7576
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
 __label_7: # switch end
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 7580
    __ARG_1.'emitnull'($S2)
 __label_5: # endif
# }
.annotate 'line', 7581

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7525
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7527
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
.annotate 'line', 7588
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7589
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7590

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7593
    self.'annotate'(__ARG_1)
.annotate 'line', 7594
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7595
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7596
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7597
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7598

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7584
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
.annotate 'line', 7607
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7608
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7609
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7610
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7611

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7614
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7615
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7616

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7619
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7620
    self.'annotate'(__ARG_1)
.annotate 'line', 7621
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7622
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 7623
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7624
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7625

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7601
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7603
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
.annotate 'line', 7630
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7631
    'RequireIdentifier'($P1)
.annotate 'line', 7632
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7633
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7634
    $P2 = __ARG_2.'get'()
.annotate 'line', 7635
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7636
    new $P5, [ 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 7638
    __ARG_2.'unget'($P2)
.annotate 'line', 7639
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
.annotate 'line', 7643
    __ARG_2.'unget'($P2)
.annotate 'line', 7644
    new $P4, [ 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 7646

.end # parseVar


.sub 'parseVolatile'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7650
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7651
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7652
    'SyntaxError'("invalid volatile type", $P1)
 __label_0: # endif
.annotate 'line', 7653
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7654

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7667
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7668
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7669
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7670
# var t: $P1
    null $P1
 __label_1: # while
.annotate 'line', 7671
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7672
    __ARG_2.'unget'($P1)
.annotate 'line', 7673
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7674
    unless_null $P2, __label_2
.annotate 'line', 7675
    'InternalError'('Unexpected null statement')
 __label_2: # endif
.annotate 'line', 7676
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 7678
    setattribute self, 'end', $P1
# }
.annotate 'line', 7679

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7682
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7683
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7684
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7685
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7686
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
 __label_1: # endif
.annotate 'line', 7687
    .return($S2)
# }
.annotate 'line', 7688

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7691
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7692
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7693
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7694
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7695
    'SyntaxError'('Label already defined', __ARG_1)
 __label_1: # endif
.annotate 'line', 7696
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7697
    $P1[$S1] = $S3
.annotate 'line', 7698
    .return($S3)
# }
.annotate 'line', 7699

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 7700
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7703
    __ARG_1.'comment'('{')
.annotate 'line', 7704
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7705
    $P1.'emit'(__ARG_1)
.annotate 'line', 7706
    self.'freetemps'()
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7708
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7709

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7660
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7662
    addattribute $P0, 'end'
.annotate 'line', 7663
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7724
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7726
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7727
    new $P1, ['ResizableStringArray']
.annotate 'line', 7728
    new $P2, ['ResizableStringArray']
.annotate 'line', 7729
    setattribute self, 'tempreg', $P1
.annotate 'line', 7730
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7731

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 7734
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7735
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7736
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7737
    assign $P1, $I1
.annotate 'line', 7738
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
 __label_0:
.annotate 'line', 7739
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7740
    .return($S1)
# }
.annotate 'line', 7741

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 7744
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7745
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7746
# reg: $S1
    null $S1
.annotate 'line', 7747
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7748
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7750
    $P4 = self.'createreg'()
    set $S1, $P4
 __label_1: # endif
.annotate 'line', 7751
# predefined push
    push $P2, $S1
.annotate 'line', 7752
    .return($S1)
# }
.annotate 'line', 7753

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 7756
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7757
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7758
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7759
# i: $I2
    sub $I2, $I1, 1
 __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7760
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7761
# predefined push
    push $P1, $S1
# }
 __label_0: # for iteration
.annotate 'line', 7759
    dec $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 7763
    assign $P2, 0
# }
.annotate 'line', 7764

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7718
    addattribute $P0, 'type'
.annotate 'line', 7719
    addattribute $P0, 'nreg'
.annotate 'line', 7720
    addattribute $P0, 'tempreg'
.annotate 'line', 7721
    addattribute $P0, 'freereg'
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7777
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7778
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = 'typetoregcheck'($P3)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7779
    eq $S1, '', __label_1
.annotate 'line', 7780
    $P1 = __ARG_2.'get'()
    goto __label_2
 __label_1: # else
.annotate 'line', 7782
    set $S1, 'P'
 __label_2: # endif
.annotate 'line', 7783
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 7784
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 7786
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 7787
    $P1 = __ARG_2.'get'()
.annotate 'line', 7788
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7789
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_4
 __label_3: # else
.annotate 'line', 7791
    __ARG_2.'unget'($P1)
 __label_4: # endif
# }
.annotate 'line', 7792

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7795
# paramname: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_0
    set $S1, $P8
 __label_0:
.annotate 'line', 7796
# var param: $P1
    $P1 = __ARG_1.'getvar'($S1)
.annotate 'line', 7797
# ptype: $S2
    $P9 = $P1.'gettype'()
    $P8 = 'typetopirname'($P9)
    null $S2
    if_null $P8, __label_1
    set $S2, $P8
 __label_1:
.annotate 'line', 7798
    $P8 = $P1.'getreg'()
    __ARG_2.'print'('        .param ', $S2, ' ', $P8)
.annotate 'line', 7799
# var modarg: $P2
    getattribute $P2, self, 'modifiers'
.annotate 'line', 7800
    if_null $P2, __label_2
# {
.annotate 'line', 7801
# var named: $P3
    null $P3
.annotate 'line', 7802
# var slurpy: $P4
    null $P4
.annotate 'line', 7803
# var modarglist: $P5
    $P5 = $P2.'getlist'()
.annotate 'line', 7804
    iter $P10, $P5
    set $P10, 0
 __label_3: # for iteration
    unless $P10 goto __label_4
    shift $P6, $P10
# {
.annotate 'line', 7805
# modname: $S3
    $P8 = $P6.'getname'()
    null $S3
    if_null $P8, __label_5
    set $S3, $P8
 __label_5:
.annotate 'line', 7806
    set $S5, $S3
    set $S6, 'named'
    if $S5 == $S6 goto __label_8
    set $S6, 'slurpy'
    if $S5 == $S6 goto __label_9
    goto __label_7
# switch
 __label_8: # case
.annotate 'line', 7808
    set $P3, $P6
    goto __label_6 # break
 __label_9: # case
.annotate 'line', 7811
    set $P4, $P6
    goto __label_6 # break
 __label_7: # default
.annotate 'line', 7814
    __ARG_2.'print'(' :', $S3)
 __label_6: # switch end
# }
    goto __label_3
 __label_4: # endfor
.annotate 'line', 7817
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_12
    isnull $I2, $P4
    not $I2
 __label_12:
    unless $I2 goto __label_10
# {
.annotate 'line', 7822
    __ARG_2.'print'(" :named :slurpy")
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 7825
    if_null $P3, __label_13
# {
.annotate 'line', 7826
# setname: $S4
    null $S4
.annotate 'line', 7827
# nargs: $I1
    $P8 = $P3.'numargs'()
    set $I1, $P8
.annotate 'line', 7828
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_17
    set $I3, 1
    if $I2 == $I3 goto __label_18
    goto __label_16
# switch
 __label_17: # case
.annotate 'line', 7830
    concat $S0, "'", $S1
    concat $S0, $S0, "'"
    set $S4, $S0
    goto __label_15 # break
 __label_18: # case
.annotate 'line', 7833
# var argmod: $P7
    $P7 = $P3.'getarg'(0)
.annotate 'line', 7834
    $P8 = $P7.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_19
.annotate 'line', 7835
    getattribute $P9, __ARG_1, 'start'
    'SyntaxError'('Invalid modifier', $P9)
 __label_19: # endif
.annotate 'line', 7836
    $P11 = $P7.'getPirString'()
    set $S4, $P11
    goto __label_15 # break
 __label_16: # default
.annotate 'line', 7839
    getattribute $P12, __ARG_1, 'start'
    'SyntaxError'('Invalid modifier', $P12)
 __label_15: # switch end
.annotate 'line', 7841
    __ARG_2.'print'(" :named(", $S4, ")")
# }
    goto __label_14
 __label_13: # else
.annotate 'line', 7843
    if_null $P4, __label_20
# {
.annotate 'line', 7844
    __ARG_2.'print'(" :slurpy")
# }
 __label_20: # endif
 __label_14: # endif
# }
 __label_11: # endif
# }
 __label_2: # endif
.annotate 'line', 7848
    __ARG_2.'say'('')
# }
.annotate 'line', 7849

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 7773
    addattribute $P0, 'name'
.annotate 'line', 7774
    addattribute $P0, 'modifiers'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7875
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7876
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 7877
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 7878
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 7879
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 7880
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 7881
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 7882

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 7884
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 7888
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 7889
    unless_null $P1, __label_0
# {
.annotate 'line', 7890
    $P1 = self.'generatesubid'()
.annotate 'line', 7891
    setattribute self, 'subid', $P1
# }
 __label_0: # endif
.annotate 'line', 7893
    .return($P1)
# }
.annotate 'line', 7894

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7898
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 7899
    .return($I1)
# }
.annotate 'line', 7900

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7903
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 7904
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 7905
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7906
    __ARG_1.'unget'($P2)
 __label_1: # do
.annotate 'line', 7907
# {
.annotate 'line', 7908
    new $P4, [ 'FunctionParameter' ]
    $P4.'FunctionParameter'(self, __ARG_1)
    set $P3, $P4
# predefined push
    push $P1, $P3
.annotate 'line', 7909
    $P2 = __ARG_1.'get'()
# }
 __label_3: # continue
.annotate 'line', 7910
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 7911
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7912
    'Expected'("')' or ','", $P2)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 7914

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7918
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 7919
    unless_null $P1, __label_0
.annotate 'line', 7920
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7922
# predefined push
    push $P1, __ARG_1
 __label_1: # endif
# }
.annotate 'line', 7923

.end # addlocalfunction


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7927
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7928
    .return(self)
# }
.annotate 'line', 7929

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7933
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 7934
    unless_null $P1, __label_0
# {
.annotate 'line', 7935
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 7936
    setattribute self, 'usedlexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 7938
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7939

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7942
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 7943
    unless_null $P1, __label_0
# {
.annotate 'line', 7944
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 7945
    setattribute self, 'lexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 7947
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 7948

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7953
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 7954
# lexname: $S1
    null $S1
.annotate 'line', 7955
    if_null $P1, __label_0
.annotate 'line', 7956
    set $S1, $P1
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7958
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 7959
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 7960
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 7961
    self.'setlex'($S1, $S2)
.annotate 'line', 7962
    __ARG_1.'setlex'($S1)
# }
 __label_1: # endif
.annotate 'line', 7964
    .return($S1)
# }
.annotate 'line', 7965

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7969
# var store: $P1
    null $P1
.annotate 'line', 7970
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
.annotate 'line', 7972
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 7974
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 7976
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 7978
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 7980
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 7982
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 7983
    .return($S1)
# }
.annotate 'line', 7984

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7987
# var store: $P1
    null $P1
.annotate 'line', 7988
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
.annotate 'line', 7990
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 7992
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 7994
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 7996
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 7998
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8000
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8001
    .return($S1)
# }
.annotate 'line', 8002

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8005
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
.annotate 'line', 8006
    $P1.'freetemps'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 8007

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8010
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 8011
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8012
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 8013
    assign $P1, $I1
.annotate 'line', 8014
    .return($S1)
# }
.annotate 'line', 8015

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8018
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 8019

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8022
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8023

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8027
# name: $S1
    getattribute $P13, self, 'name'
    null $S1
    if_null $P13, __label_0
    set $S1, $P13
 __label_0:
.annotate 'line', 8028
    __ARG_1.'say'()
.annotate 'line', 8029
    __ARG_1.'print'(".sub ")
.annotate 'line', 8030
    $P13 = self.'isanonymous'()
    if_null $P13, __label_1
    unless $P13 goto __label_1
.annotate 'line', 8031
    __ARG_1.'print'("'' :anon")
    goto __label_2
 __label_1: # else
.annotate 'line', 8033
    __ARG_1.'print'("'", $S1, "'")
 __label_2: # endif
.annotate 'line', 8034
    getattribute $P13, self, 'subid'
    if_null $P13, __label_3
.annotate 'line', 8035
    getattribute $P14, self, 'subid'
    __ARG_1.'print'(" :subid('", $P14, "')")
 __label_3: # endif
.annotate 'line', 8036
    getattribute $P13, self, 'outer'
    if_null $P13, __label_4
# {
.annotate 'line', 8037
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8038
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8039
    if_null $P2, __label_5
.annotate 'line', 8040
    __ARG_1.'print'(" :outer('", $P2, "')")
 __label_5: # endif
# }
 __label_4: # endif
.annotate 'line', 8044
    $P13 = self.'ismethod'()
    if_null $P13, __label_6
    unless $P13 goto __label_6
.annotate 'line', 8045
    __ARG_1.'print'(' :method')
 __label_6: # endif
.annotate 'line', 8046
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8047
    if_null $P3, __label_7
# {
.annotate 'line', 8048
# var mlist: $P4
    $P4 = $P3.'getlist'()
.annotate 'line', 8049
    iter $P15, $P4
    set $P15, 0
 __label_9: # for iteration
    unless $P15 goto __label_10
    shift $P5, $P15
# {
.annotate 'line', 8050
# nargmods: $I1
    $P13 = $P5.'numargs'()
    set $I1, $P13
.annotate 'line', 8051
    $P13 = $P5.'getname'()
    __ARG_1.'print'(' :', $P13)
.annotate 'line', 8052
    le $I1, 0, __label_11
# {
.annotate 'line', 8053
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8054
# iargmod: $I2
    null $I2
 __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 8055
# var argmod: $P6
    $P6 = $P5.'getarg'($I2)
.annotate 'line', 8056
    $P13 = $P6.'isstringliteral'()
    isfalse $I4, $P13
    unless $I4 goto __label_15
.annotate 'line', 8057
    getattribute $P14, $P6, 'start'
    'SyntaxError'('Invalid modifier', $P14)
 __label_15: # endif
.annotate 'line', 8058
    $P13 = $P6.'getPirString'()
    __ARG_1.'print'($P13)
# }
 __label_12: # for iteration
.annotate 'line', 8054
    inc $I2
    goto __label_14
 __label_13: # for end
.annotate 'line', 8060
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
.annotate 'line', 8065
    ne $S1, 'main', __label_16
.annotate 'line', 8066
    __ARG_1.'print'(' :main')
 __label_16: # endif
# }
 __label_8: # endif
.annotate 'line', 8068
    __ARG_1.'say'()
.annotate 'line', 8071
    getattribute $P13, self, 'params'
    iter $P16, $P13
    set $P16, 0
 __label_17: # for iteration
    unless $P16 goto __label_18
    shift $P7, $P16
.annotate 'line', 8072
    $P7.'emit'(self, __ARG_1)
    goto __label_17
 __label_18: # endfor
.annotate 'line', 8074
# var lexicals: $P8
    getattribute $P8, self, 'lexicals'
.annotate 'line', 8075
# var usedlexicals: $P9
    getattribute $P9, self, 'usedlexicals'
.annotate 'line', 8076
    isnull $I4, $P8
    not $I4
    if $I4 goto __label_20
    isnull $I4, $P9
    not $I4
 __label_20:
    unless $I4 goto __label_19
# {
.annotate 'line', 8077
    getattribute $P13, self, 'start'
    __ARG_1.'annotate'($P13)
.annotate 'line', 8079
    if_null $P8, __label_21
# {
.annotate 'line', 8081
    iter $P17, $P8
    set $P17, 0
 __label_22: # for iteration
    unless $P17 goto __label_23
    shift $S2, $P17
.annotate 'line', 8082
    $P13 = $P8[$S2]
    __ARG_1.'say'(".lex '", $P13, "', ", $S2)
    goto __label_22
 __label_23: # endfor
# }
 __label_21: # endif
.annotate 'line', 8085
    if_null $P9, __label_24
# {
.annotate 'line', 8087
    iter $P18, $P9
    set $P18, 0
 __label_25: # for iteration
    unless $P18 goto __label_26
    shift $S3, $P18
.annotate 'line', 8088
    $P13 = $P9[$S3]
    __ARG_1.'emitfind_lex'($S3, $P13)
    goto __label_25
 __label_26: # endfor
# }
 __label_24: # endif
# }
 __label_19: # endif
.annotate 'line', 8092
# var body: $P10
    getattribute $P10, self, 'body'
.annotate 'line', 8093
    $P13 = $P10.'isempty'()
    if_null $P13, __label_27
    unless $P13 goto __label_27
.annotate 'line', 8094
    __ARG_1.'comment'('Empty body')
    goto __label_28
 __label_27: # else
# {
.annotate 'line', 8096
    __ARG_1.'comment'('Body')
.annotate 'line', 8097
    $P10.'emit'(__ARG_1)
.annotate 'line', 8098
    $P13 = $P10.'getend'()
    __ARG_1.'annotate'($P13)
# }
 __label_28: # endif
.annotate 'line', 8100
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8103
# var localfun: $P11
    getattribute $P11, self, 'localfun'
.annotate 'line', 8104
    if_null $P11, __label_29
# {
# for loop
.annotate 'line', 8105
# ifn: $I3
    null $I3
 __label_32: # for condition
# predefined elements
    elements $I4, $P11
    ge $I3, $I4, __label_31
# {
.annotate 'line', 8106
# var fn: $P12
    $P12 = $P11[$I3]
.annotate 'line', 8107
    $P12.'emit'(__ARG_1)
# }
 __label_30: # for iteration
.annotate 'line', 8105
    inc $I3
    goto __label_32
 __label_31: # for end
# }
 __label_29: # endif
# }
.annotate 'line', 8110

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 7856
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7858
    addattribute $P0, 'name'
.annotate 'line', 7859
    addattribute $P0, 'subid'
.annotate 'line', 7860
    addattribute $P0, 'modifiers'
.annotate 'line', 7861
    addattribute $P0, 'params'
.annotate 'line', 7862
    addattribute $P0, 'body'
.annotate 'line', 7863
    addattribute $P0, 'regstI'
.annotate 'line', 7864
    addattribute $P0, 'regstN'
.annotate 'line', 7865
    addattribute $P0, 'regstS'
.annotate 'line', 7866
    addattribute $P0, 'regstP'
.annotate 'line', 7867
    addattribute $P0, 'nlabel'
.annotate 'line', 7868
    addattribute $P0, 'localfun'
.annotate 'line', 7869
    addattribute $P0, 'lexicals'
.annotate 'line', 7870
    addattribute $P0, 'usedlexicals'
.annotate 'line', 7871
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8124
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8125
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8126
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8127
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8128

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8130
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8134
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8135
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8136
    assign $P1, $I1
.annotate 'line', 8137
    .return($I1)
# }
.annotate 'line', 8138

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8142
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8143
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8144
    assign $P1, $I1
.annotate 'line', 8145
    .return($I1)
# }
.annotate 'line', 8146

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8147
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8151
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8152
    setattribute self, 'name', $P1
.annotate 'line', 8153
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8154
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 8155
    new $P7, [ 'ModifierList' ]
    $P7.'ModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8156
    $P2 = __ARG_1.'get'()
# }
 __label_0: # endif
.annotate 'line', 8158
    'RequireOp'('(', $P2)
.annotate 'line', 8159
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8161
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8162
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8164
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 8165
    new $P7, [ 'TokenQuoted' ]
    getattribute $P8, $P1, 'file'
    getattribute $P9, $P1, 'line'
# predefined join
    join $S1, '.', $P3
    $P7.'TokenQuoted'($P8, $P9, $S1)
    set $P6, $P7
    $P5.'StringLiteral'(self, $P6)
    set $P4, $P5
.annotate 'line', 8163
    self.'createconst'('__FUNCTION__', 'S', $P4, '')
.annotate 'line', 8168
    $P2 = __ARG_1.'get'()
.annotate 'line', 8169
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8170
    'ExpectedOp'('{', $P2)
 __label_1: # endif
.annotate 'line', 8171
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8172
    .return(self)
# }
.annotate 'line', 8173

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8117
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8119
    addattribute $P0, 'paramnum'
.annotate 'line', 8120
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8184
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8185
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8186
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8187
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8188
    setattribute self, 'name', $P1
.annotate 'line', 8189
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8190
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8191
    'RequireOp'('{', $P2)
.annotate 'line', 8192
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8193
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8194

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8195
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8196
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8199
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8200

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8204
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8205

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8209
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8210

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8213
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8214
    unless_null $P1, __label_0
# {
.annotate 'line', 8217
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8218
    unless_null $P1, __label_1
# {
.annotate 'line', 8220
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8221
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8222
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8223
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
 __label_5:
.annotate 'line', 8224
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8225
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 8226
    self.'setusedlex'($S1, $S2)
# }
 __label_4: # endif
# }
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 8230
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
 __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8231
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8232
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8233
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8234
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_9
# {
.annotate 'line', 8235
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8236
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
 __label_11:
.annotate 'line', 8237
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8238
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8239
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8240
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 8241
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
.annotate 'line', 8246
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
 __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8247
    'InternalError'('Incorrect data for variable in LocalFunction')
 __label_13: # endif
.annotate 'line', 8248
    .return($P1)
# }
.annotate 'line', 8249

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8180
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
.annotate 'line', 8260
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8261

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8262
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8256
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
.annotate 'line', 8279
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8280

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8281
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8285
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8286

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8275
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8294
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8295
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8296

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8297
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8301
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 8302
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8303

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8289
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8291
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8312
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8313
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8314
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8315
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8316
    'Expected'('literal string', $P2)
 __label_0: # endif
.annotate 'line', 8317
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8318
    $P2 = __ARG_1.'get'()
.annotate 'line', 8319
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8320
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 8322
    box $P5, 1
    setattribute self, 'hll', $P5
 __label_5: # case
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 8326
    'SyntaxError'('Unexpected token in class key', $P2)
 __label_2: # switch end
 __label_6: # do
.annotate 'line', 8328
# {
.annotate 'line', 8329
    $P2 = __ARG_1.'get'()
.annotate 'line', 8330
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8331
    'Expected'('literal string', $P2)
 __label_9: # endif
.annotate 'line', 8332
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
 __label_8: # continue
.annotate 'line', 8333
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
 __label_7: # enddo
.annotate 'line', 8334
    'RequireOp'(']', $P2)
# }
 __label_1: # endif
.annotate 'line', 8336
    setattribute self, 'key', $P1
# }
.annotate 'line', 8337

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8338
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8341
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8342

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8346
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8347

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8306
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8308
    addattribute $P0, 'key'
.annotate 'line', 8309
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8355
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8356
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8357
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 8358
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8359
    $P2 = __ARG_1.'get'()
.annotate 'line', 8360
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 8362
    __ARG_1.'unget'($P2)
.annotate 'line', 8363
    setattribute self, 'key', $P1
# }
.annotate 'line', 8364

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8365
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8369
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8370
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8371

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8375
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8376
    unless_null $P1, __label_0
# {
.annotate 'line', 8377
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8378
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
 __label_2: # endif
.annotate 'line', 8379
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 8381
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
 __label_1: # endif
# }
.annotate 'line', 8382

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8350
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8352
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8387
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8388
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8389
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_0: # endif
.annotate 'line', 8390
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8391
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_1: # endif
.annotate 'line', 8392
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8393
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_2: # endif
.annotate 'line', 8394
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8395

.end # parseClassSpecifier

.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8413
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8414
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8415
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8416
    setattribute self, 'functions', $P1
.annotate 'line', 8417
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8418
    setattribute self, 'members', $P2
.annotate 'line', 8419
    root_new $P13, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P13
.annotate 'line', 8420
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8421
    setattribute self, 'constants', $P3
.annotate 'line', 8423
# var name: $P4
    $P4 = __ARG_2.'get'()
.annotate 'line', 8424
    setattribute self, 'name', $P4
.annotate 'line', 8425
# var classns: $P5
    $P12 = __ARG_3.'getpath'()
# predefined clone
    clone $P5, $P12
.annotate 'line', 8426
    getattribute $P12, self, 'name'
# predefined push
    push $P5, $P12
.annotate 'line', 8427
    setattribute self, 'classns', $P5
.annotate 'line', 8429
# var t: $P6
    $P6 = __ARG_2.'get'()
.annotate 'line', 8430
    $P12 = $P6.'isop'(':')
    if_null $P12, __label_0
    unless $P12 goto __label_0
# {
.annotate 'line', 8431
# var bases: $P7
    getattribute $P7, self, 'bases'
 __label_2: # Infinite loop
.annotate 'line', 8432
# {
.annotate 'line', 8433
# var base: $P8
    $P8 = 'parseClassSpecifier'(__ARG_2, self)
.annotate 'line', 8434
# predefined push
    push $P7, $P8
.annotate 'line', 8435
    $P6 = __ARG_2.'get'()
.annotate 'line', 8436
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
.annotate 'line', 8439
    'RequireOp'('{', $P6)
# for loop
.annotate 'line', 8440
    $P6 = __ARG_2.'get'()
 __label_6: # for condition
    $P12 = $P6.'isop'('}')
    isfalse $I1, $P12
    unless $I1 goto __label_5
# {
.annotate 'line', 8441
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
.annotate 'line', 8443
# var f: $P9
    new $P9, [ 'MethodStatement' ]
    $P9.'MethodStatement'($P6, __ARG_2, self)
.annotate 'line', 8444
# predefined push
    push $P1, $P9
    goto __label_7 # break
 __label_10: # case
.annotate 'line', 8447
# var name: $P10
    $P10 = __ARG_2.'get'()
.annotate 'line', 8448
    $P14 = $P10.'isidentifier'()
    isfalse $I2, $P14
    unless $I2 goto __label_12
.annotate 'line', 8449
    'Expected'("member identifier", $P10)
 __label_12: # endif
.annotate 'line', 8450
# predefined push
    push $P2, $P10
.annotate 'line', 8451
    $P6 = __ARG_2.'get'()
.annotate 'line', 8452
    $P15 = $P6.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_13
.annotate 'line', 8453
    'Expected'("';' in member declaration", $P6)
 __label_13: # endif
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 8456
# var cst: $P11
    $P11 = 'parseConst'($P6, __ARG_2, self)
.annotate 'line', 8457
# predefined push
    push $P3, $P11
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 8460
    'SyntaxError'("Unexpected item in class", $P6)
 __label_7: # switch end
# }
 __label_4: # for iteration
.annotate 'line', 8440
    $P6 = __ARG_2.'get'()
    goto __label_6
 __label_5: # for end
# }
.annotate 'line', 8463

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8466
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8467

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8470
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8471

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8474
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8475

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8478
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8479

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8482
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8483

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8486
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8487

.end # use_predef


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8490
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8491
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8492
    .return(self)
# }
.annotate 'line', 8493

.end # optimize


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8496
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8497

.end # getclasskey


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8500
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8501
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8502
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8503
    $P2.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8505
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8507
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8508
# n: $I1
    set $I1, 1
.annotate 'line', 8509
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8510
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8511
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8512
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8513
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8514
    __ARG_1.'say'()
.annotate 'line', 8515
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8517
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
 __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8518
    __ARG_1.'annotate'($P4)
.annotate 'line', 8519
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 8522
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8523

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8401
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8403
    addattribute $P0, 'parent'
.annotate 'line', 8404
    addattribute $P0, 'name'
.annotate 'line', 8405
    addattribute $P0, 'bases'
.annotate 'line', 8406
    addattribute $P0, 'constants'
.annotate 'line', 8407
    addattribute $P0, 'functions'
.annotate 'line', 8408
    addattribute $P0, 'members'
.annotate 'line', 8409
    addattribute $P0, 'classns'
.end
.namespace [ ]

.sub 'include_parrot'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8532
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8533
    $P6 = $P1.'isstring'()
    isfalse $I4, $P6
    unless $I4 goto __label_0
.annotate 'line', 8534
    'Expected'('literal string', $P1)
 __label_0: # endif
.annotate 'line', 8535
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8536
# filename: $S1
    $P6 = $P1.'rawstring'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
 __label_1:
.annotate 'line', 8537
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8542
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8543
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8544
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8545
    iter $P7, $P4
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $S2, $P7
# {
.annotate 'line', 8546
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8547
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_4
    push_eh $P6
# try: begin
# {
.annotate 'line', 8548
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8549
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8547
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
.annotate 'line', 8554
    $P6 = $P5.'is_closed'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 8555
    'SyntaxError'('File not found', $P1)
 __label_6: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 8560
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
.annotate 'line', 8561
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_11
# {
.annotate 'line', 8562
# pos: $I1
    set $I1, 12
.annotate 'line', 8563
# c: $S5
    null $S5
 __label_13: # while
.annotate 'line', 8564
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_14
    iseq $I4, $S5, "\t"
 __label_14:
    unless $I4 goto __label_12
.annotate 'line', 8565
    inc $I1
    goto __label_13
 __label_12: # endwhile
.annotate 'line', 8566
# pos2: $I2
    set $I2, $I1
 __label_16: # while
.annotate 'line', 8567
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_20
    isne $I4, $S5, "\t"
 __label_20:
    unless $I4 goto __label_19
.annotate 'line', 8568
    isne $I4, $S5, "\n"
 __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, "\r"
 __label_18:
    unless $I4 goto __label_17
    isne $I4, $S5, ""
 __label_17:
    unless $I4 goto __label_15
.annotate 'line', 8569
    inc $I2
    goto __label_16
 __label_15: # endwhile
.annotate 'line', 8570
    ne $I2, $I1, __label_21
    goto __label_7 # continue
 __label_21: # endif
.annotate 'line', 8572
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
 __label_23: # while
.annotate 'line', 8573
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_24
    iseq $I4, $S5, "\t"
 __label_24:
    unless $I4 goto __label_22
.annotate 'line', 8574
    inc $I2
    goto __label_23
 __label_22: # endwhile
.annotate 'line', 8575
    set $I1, $I2
 __label_26: # while
.annotate 'line', 8576
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_30
    isne $I4, $S5, "\t"
 __label_30:
    unless $I4 goto __label_29
.annotate 'line', 8577
    isne $I4, $S5, "\n"
 __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, "\r"
 __label_28:
    unless $I4 goto __label_27
    isne $I4, $S5, ""
 __label_27:
    unless $I4 goto __label_25
.annotate 'line', 8578
    inc $I2
    goto __label_26
 __label_25: # endwhile
.annotate 'line', 8579
    ne $I2, $I1, __label_31
    goto __label_7 # continue
 __label_31: # endif
.annotate 'line', 8581
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 8583
# ivalue: $I3
    null $I3
.annotate 'line', 8584
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_34
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
 __label_34:
    unless $I4 goto __label_32
.annotate 'line', 8585
# predefined substr
    substr $S10, $S7, 2
    box $P8, $S10
    $P6 = $P8.'to_int'(16)
    set $I3, $P6
    goto __label_33
 __label_32: # else
.annotate 'line', 8587
    set $I3, $S7
 __label_33: # endif
.annotate 'line', 8590
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, __ARG_1, 'file'
    getattribute $P11, __ARG_1, 'line'
    $P9.'TokenInteger'($P10, $P11, $S6)
    set $P8, $P9
.annotate 'line', 8589
    $P6 = 'integerValue'(__ARG_3, $P8, $I3)
.annotate 'line', 8588
    __ARG_3.'createconst'($S6, 'I', $P6, '')
# }
 __label_11: # endif
# }
 __label_7: # for iteration
.annotate 'line', 8560
    $P6 = $P5.'readline'()
    set $S4, $P6
    goto __label_9
 __label_8: # for end
.annotate 'line', 8595
    $P5.'close'()
# }
.annotate 'line', 8596

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8611
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 8612
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8613
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8614
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8615
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8616

.end # NamespaceBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8619
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8620

.end # getpath


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8623
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8624
    iter $P3, $P1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8625
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 8626
    .return($P2)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P4
.annotate 'line', 8627
    .return($P4)
# }
.annotate 'line', 8628

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8633
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
.annotate 'line', 8635
    .return($P5)
 __label_3: # case
.annotate 'line', 8638
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
 __label_1: # default
.annotate 'line', 8643
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 8644
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 8645
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 8646
    iter $P8, $P1
    set $P8, 0
 __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 8647
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 8648
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8649
    if_null $P4, __label_8
.annotate 'line', 8650
    .return($P4)
 __label_8: # endif
# }
 __label_7: # endif
# }
    goto __label_5
 __label_6: # endfor
 __label_0: # switch end
    null $P5
.annotate 'line', 8654
    .return($P5)
# }
.annotate 'line', 8655

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8660
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
.annotate 'line', 8662
    .return($P7)
 __label_3: # case
.annotate 'line', 8664
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 8666
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 8667
    if_null $P1, __label_4
.annotate 'line', 8668
    .return($P1)
 __label_4: # endif
.annotate 'line', 8669
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
 __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 8670
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 8671
    .return($P2)
 __label_7: # endif
    goto __label_5
 __label_6: # endfor
    null $P11
.annotate 'line', 8672
    .return($P11)
 __label_1: # default
.annotate 'line', 8677
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 8678
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 8679
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
 __label_8:
.annotate 'line', 8680
    iter $P13, $P3
    set $P13, 0
 __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 8681
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 8682
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8683
    if_null $P6, __label_12
.annotate 'line', 8684
    .return($P6)
 __label_12: # endif
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
 __label_0: # switch end
    null $P7
.annotate 'line', 8688
    .return($P7)
# }
.annotate 'line', 8689

.end # findsymbol


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8692
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8693
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 8694
    $P1 = __ARG_2.'get'()
.annotate 'line', 8696
# var modifier: $P2
    null $P2
.annotate 'line', 8697
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8698
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 8699
    $P1 = __ARG_2.'get'()
# }
 __label_1: # endif
.annotate 'line', 8702
    'RequireOp'('{', $P1)
.annotate 'line', 8703
# var child: $P3
    new $P3, [ 'NamespaceStatement' ]
    $P3.'NamespaceStatement'(self, __ARG_1, $S1, $P2)
.annotate 'line', 8704
    getattribute $P4, self, 'namespaces'
# predefined push
    push $P4, $P3
.annotate 'line', 8705
    getattribute $P4, self, 'items'
# predefined push
    push $P4, $P3
.annotate 'line', 8706
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 8707

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8710
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 8711
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 8712
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 8713
# var t: $P4
    null $P4
# for loop
.annotate 'line', 8714
    $P4 = __ARG_1.'get'()
 __label_2: # for condition
    set $I1, $P4
    unless $I1 goto __label_3
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 8716
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
.annotate 'line', 8718
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 8721
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 8722
# predefined push
    push $P1, $P5
    goto __label_4 # break
 __label_8: # case
.annotate 'line', 8725
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 8726
# predefined push
    push $P2, $P6
.annotate 'line', 8727
# predefined push
    push $P1, $P6
    goto __label_4 # break
 __label_9: # case
.annotate 'line', 8730
# var c: $P7
    new $P7, [ 'ClassStatement' ]
    $P7.'ClassStatement'($P4, __ARG_1, self)
.annotate 'line', 8731
# predefined push
    push $P3, $P7
.annotate 'line', 8732
# predefined push
    push $P1, $P7
    goto __label_4 # break
 __label_10: # case
.annotate 'line', 8735
    $P4 = __ARG_1.'get'()
.annotate 'line', 8736
    $P10 = $P4.'iskeyword'('extern')
    isfalse $I2, $P10
    unless $I2 goto __label_14
.annotate 'line', 8737
    'SyntaxError'('Unsupported at namespace level', $P4)
 __label_14: # endif
.annotate 'line', 8738
    $P4 = __ARG_1.'get'()
.annotate 'line', 8739
    $P11 = $P4.'isstring'()
    isfalse $I3, $P11
    unless $I3 goto __label_15
.annotate 'line', 8740
    'Expected'('string literal', $P4)
 __label_15: # endif
.annotate 'line', 8741
# reqlib: $S1
    set $P12, $P4
    null $S1
    if_null $P12, __label_16
    set $S1, $P12
 __label_16:
.annotate 'line', 8742
    self.'addlib'($S1)
.annotate 'line', 8743
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
 __label_11: # case
.annotate 'line', 8746
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_12: # case
.annotate 'line', 8749
    $P4 = __ARG_1.'get'()
.annotate 'line', 8750
    $P13 = $P4.'isstring'()
    isfalse $I4, $P13
    unless $I4 goto __label_17
.annotate 'line', 8751
    'Expected'('string literal', $P4)
 __label_17: # endif
.annotate 'line', 8752
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8753
    new $P16, [ 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P4)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_4 # break
 __label_13: # case
.annotate 'line', 8756
    $P4 = __ARG_1.'get'()
.annotate 'line', 8757
    $P17 = $P4.'isstring'()
    isfalse $I5, $P17
    unless $I5 goto __label_18
.annotate 'line', 8758
    'Expected'('string literal', $P4)
 __label_18: # endif
.annotate 'line', 8759
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 8760
    new $P20, [ 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P4)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 8763
    'SyntaxError'("Unexpected token", $P4)
 __label_4: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 8714
    $P4 = __ARG_1.'get'()
    goto __label_2
 __label_1: # for end
.annotate 'line', 8766
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 8767
    self.'close_ns'($P4)
    goto __label_20
 __label_19: # else
.annotate 'line', 8769
    self.'unclosed_ns'()
 __label_20: # endif
# }
.annotate 'line', 8770

.end # parse


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 8773
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 8774

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8777
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 8778
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 8780
# activate: $I1
    set $I1, 1
.annotate 'line', 8781
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
 __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8782
    isa $I2, $P2, [ 'NamespaceStatement' ]
    if $I2 goto __label_5
.annotate 'line', 8783
    isa $I2, $P2, [ 'ClassStatement' ]
 __label_5:
    unless $I2 goto __label_3
.annotate 'line', 8784
    set $I1, 1
    goto __label_4
 __label_3: # else
.annotate 'line', 8786
    unless $I1 goto __label_6
# {
.annotate 'line', 8787
    __ARG_1.'say'($S1)
.annotate 'line', 8788
    null $I1
# }
 __label_6: # endif
 __label_4: # endif
.annotate 'line', 8790
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 8792

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8600
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8602
    addattribute $P0, 'nspath'
.annotate 'line', 8603
    addattribute $P0, 'namespaces'
.annotate 'line', 8604
    addattribute $P0, 'classes'
.annotate 'line', 8605
    addattribute $P0, 'functions'
.annotate 'line', 8606
    addattribute $P0, 'items'
.annotate 'line', 8607
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
.annotate 'line', 8810
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8811
# predefined push
    push $P1, __ARG_3
.annotate 'line', 8812
    self.'NamespaceBase'($P1)
.annotate 'line', 8814
    setattribute self, 'parent', __ARG_1
.annotate 'line', 8815
    setattribute self, 'start', __ARG_2
.annotate 'line', 8816
    setattribute self, 'owner', __ARG_1
.annotate 'line', 8817
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 8818
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 8819
    if_null __ARG_4, __label_0
# {
.annotate 'line', 8820
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 8821
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
 __label_1: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8823

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 8826
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8827

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8830
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8831

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8834
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8835

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8838
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 8839

.end # addlib


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8842
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 8843

.end # addlib


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8846
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 8847
    unless_null $P1, __label_0
.annotate 'line', 8848
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 8850
    .return($P1)
 __label_1: # endif
# }
.annotate 'line', 8851

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8856
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 8857
    unless_null $P1, __label_0
.annotate 'line', 8858
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
 __label_0: # endif
.annotate 'line', 8859
    .return($P1)
# }
.annotate 'line', 8860

.end # findclasskey


.sub 'unclosed_ns' :method
# Body
# {
.annotate 'line', 8863
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 8864

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8871
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 8872
    if_null $P1, __label_0
# {
.annotate 'line', 8873
    $P1 = $P1.'optimize'()
.annotate 'line', 8874
    setattribute self, 'modifier', $P1
# }
 __label_0: # endif
.annotate 'line', 8876
    self.'optimize_base'()
.annotate 'line', 8877
    .return(self)
# }
.annotate 'line', 8878

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8881
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 8882
    if_null $P1, __label_0
.annotate 'line', 8883
    __ARG_1.'say'(".HLL '", $P1, "'")
 __label_0: # endif
.annotate 'line', 8885
    self.'emit_base'(__ARG_1)
.annotate 'line', 8887
    if_null $P1, __label_1
.annotate 'line', 8888
    __ARG_1.'say'(".HLL 'parrot'")
 __label_1: # endif
# }
.annotate 'line', 8889

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 8799
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8801
    addattribute $P0, 'parent'
.annotate 'line', 8802
    addattribute $P0, 'start'
.annotate 'line', 8803
    addattribute $P0, 'name'
.annotate 'line', 8804
    addattribute $P0, 'modifier'
.annotate 'line', 8805
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8906
    new $P1, ['ResizableStringArray']
.annotate 'line', 8907
    self.'NamespaceBase'($P1)
.annotate 'line', 8908
    setattribute self, 'unit', __ARG_1
.annotate 'line', 8909
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 8910
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 8911

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8914
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8915
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8916

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8919
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8920
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
 __label_1:
    set $I1, 1
 __label_0:
    .return($I1)
# }
.annotate 'line', 8921

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8925
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 8926
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8927
    inc $I1
.annotate 'line', 8928
    assign $P1, $I1
.annotate 'line', 8929
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 8930
    .return($S1)
# }
.annotate 'line', 8931

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8935
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 8936
    unless_null $P1, __label_0
# {
.annotate 'line', 8937
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8938
    setattribute self, 'libs', $P1
# }
 __label_0: # endif
.annotate 'line', 8940
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8941

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8944
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 8945
    unless_null $P1, __label_0
# {
.annotate 'line', 8946
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8947
    setattribute self, 'loads', $P1
# }
 __label_0: # endif
.annotate 'line', 8949
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8950

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8953
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 8954

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8958
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 8959

.end # findclasskey


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8966
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 8967

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 8970
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 8971

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8974
    self.'optimize_base'()
.annotate 'line', 8975
    .return(self)
# }
.annotate 'line', 8976

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8979
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 8982
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 8983
    self.'addload'('"String/Utils.pbc"')
 __label_0: # endif
.annotate 'line', 8986
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
.annotate 'line', 8989
    iter $P6, $P2
    set $P6, 0
 __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 8990
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 8991
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 8992
# }
 __label_3: # endif
    goto __label_1
 __label_2: # endfor
.annotate 'line', 8995
# somelib: $I1
    null $I1
.annotate 'line', 8996
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 8997
    if_null $P3, __label_4
# {
.annotate 'line', 8998
    set $I1, 1
.annotate 'line', 8999
    iter $P7, $P3
    set $P7, 0
 __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 9000
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
 __label_6: # endfor
# }
 __label_4: # endif
.annotate 'line', 9003
# someload: $I2
    null $I2
.annotate 'line', 9004
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9005
    if_null $P4, __label_7
# {
.annotate 'line', 9006
    set $I2, 1
.annotate 'line', 9007
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9008
    iter $P8, $P4
    set $P8, 0
 __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 9009
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
 __label_9: # endfor
.annotate 'line', 9010
    __ARG_1.'print'(".end\n\n")
# }
 __label_7: # endif
.annotate 'line', 9012
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 9013
    __ARG_1.'comment'('end libs')
 __label_10: # endif
.annotate 'line', 9015
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9016

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 8896
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 8898
    addattribute $P0, 'unit'
.annotate 'line', 8899
    addattribute $P0, 'predefs_used'
.annotate 'line', 8900
    addattribute $P0, 'libs'
.annotate 'line', 8901
    addattribute $P0, 'loads'
.annotate 'line', 8902
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9032
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 9033
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9036
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9040
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9039
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 9038
    $P1.'createconst'('false', 'I', $P3, '')
.annotate 'line', 9044
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9043
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 9042
    $P1.'createconst'('true', 'I', $P3, '')
.annotate 'line', 9050
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 9051
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
.annotate 'line', 9049
    $P1.'createconst'('__STAGE__', 'S', $P3, '')
.annotate 'line', 9054
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9055

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9058
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9059

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9062
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9063

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9066
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 9067

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9070
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9071

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9074
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9075
    __ARG_1.'say'('')
.annotate 'line', 9077
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9079
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9080

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9027
    addattribute $P0, 'rootns'
.annotate 'line', 9028
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9089
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 9090
    .return(__ARG_1)
 __label_0: # endif
.annotate 'line', 9091
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9092
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9093
# var emit: $P2
    new $P2, [ 'Emit' ]
.annotate 'line', 9094
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 9095
    $P2.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9096
    $P2.'initialize'($P1)
.annotate 'line', 9097
    __ARG_1.'emit'($P2)
.annotate 'line', 9098
    $P2.'close'()
.annotate 'line', 9099
    $P1.'close'()
.annotate 'line', 9100
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 9101
# var object: $P3
    null $P3
.annotate 'line', 9102
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
.annotate 'line', 9104
    new $P3, [ 'String' ]
.annotate 'line', 9105
    assign $P3, $S1
    goto __label_3 # break
 __label_6: # case
 __label_7: # case
.annotate 'line', 9109
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9110
    $P3 = $P4($S1)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 9111
# predefined die
.annotate 'line', 9113
    die 'Invalid target'
 __label_3: # switch end
.annotate 'line', 9115
    .return($P3)
# }
.annotate 'line', 9116

.end # __private_compile_tail


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9122
    unless_null __ARG_2, __label_0
.annotate 'line', 9123
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9124
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9125
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9126
    $P1.'puts'(__ARG_1)
.annotate 'line', 9127
    $P1.'close'()
.annotate 'line', 9128
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9129
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9130
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9131
    unless __ARG_4 goto __label_1
.annotate 'line', 9132
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9133
    $P3.'parse'($P2)
.annotate 'line', 9134
    $P1.'close'()
.annotate 'line', 9135
    $P3.'optimize'()
.annotate 'line', 9136
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9137

.end # compile


.sub 'compile_from_file_to_pir' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9142
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9143
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9144
    $P1.'encoding'('utf8')
.annotate 'line', 9145
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9146
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9147
    unless __ARG_4 goto __label_0
.annotate 'line', 9148
    $P3.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9149
    $P3.'parse'($P2)
.annotate 'line', 9150
    $P1.'close'()
.annotate 'line', 9151
    $P3.'optimize'()
.annotate 'line', 9152
# var emit: $P4
    new $P4, [ 'Emit' ]
.annotate 'line', 9153
    unless __ARG_3 goto __label_1
.annotate 'line', 9154
    $P4.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9155
    $P4.'initialize'(__ARG_2)
.annotate 'line', 9156
    $P3.'emit'($P4)
.annotate 'line', 9157
    $P4.'close'()
# }
.annotate 'line', 9158

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9164
    unless_null __ARG_2, __label_0
.annotate 'line', 9165
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9166
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9167
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9168
    $P1.'encoding'('utf8')
.annotate 'line', 9169
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9170
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9171
    unless __ARG_4 goto __label_1
.annotate 'line', 9172
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9173
    $P3.'parse'($P2)
.annotate 'line', 9174
    $P1.'close'()
.annotate 'line', 9175
    $P3.'optimize'()
.annotate 'line', 9176
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9177

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
# Body
# {
.annotate 'line', 9184
# var winxed: $P1
    new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9185
    not $I1, __ARG_3
    unless $I1 goto __label_0
.annotate 'line', 9186
    $P1.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9187
    $P1.'parse'(__ARG_1)
.annotate 'line', 9189
    $P1.'optimize'()
.annotate 'line', 9191
# var handle: $P2
    null $P2
.annotate 'line', 9192
    ne __ARG_2, '-', __label_1
.annotate 'line', 9193
# predefined getstdout
    getstdout $P2
    goto __label_2
 __label_1: # else
.annotate 'line', 9195
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'(__ARG_2,'w')
 __label_2: # endif
.annotate 'line', 9196
# var emit: $P3
    new $P3, [ 'Emit' ]
.annotate 'line', 9197
    unless __ARG_4 goto __label_3
.annotate 'line', 9198
    $P3.'disable_annotations'()
 __label_3: # endif
.annotate 'line', 9199
    $P3.'initialize'($P2)
.annotate 'line', 9200
    $P1.'emit'($P3)
.annotate 'line', 9201
    $P3.'close'()
.annotate 'line', 9202
    $P2.'close'()
# }
.annotate 'line', 9203

.end # winxed_parser


.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9211
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9212
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9213

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9222
    load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9223
# var getopts: $P1
    new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9224
    $P1.'notOptStop'(1)
.annotate 'line', 9225
    $P1.'push_string'('o=s')
.annotate 'line', 9226
    $P1.'push_string'('e=s')
.annotate 'line', 9227
    $P1.'push_string'('noan')
.annotate 'line', 9228
    $P1.'push_string'('nowarn')
.annotate 'line', 9229
    $P1.'notOptStop'(1)
.annotate 'line', 9230
    __ARG_1.'shift'()
.annotate 'line', 9231
# var opts: $P2
    $P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9232
    setattribute self, 'getopts', $P1
.annotate 'line', 9233
    setattribute self, 'opts', $P2
# }
.annotate 'line', 9234

.end # Options


.sub 'getbool' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9237
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9238
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9239
    isnull $I1, $P2
    not $I1
    .return($I1)
# }
.annotate 'line', 9240

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 9243
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9244
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9245
    if_null $P2, __label_1
# predefined string
    set $S1, $P2
    goto __label_0
 __label_1:
    set $S1, __ARG_2
 __label_0:
    .return($S1)
# }
.annotate 'line', 9246

.end # getstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Options' ]
.annotate 'line', 9217
    addattribute $P0, 'getopts'
.annotate 'line', 9218
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9251
# var options: $P1
    new $P1, [ 'Options' ]
    $P1.'Options'(__ARG_1)
.annotate 'line', 9252
# outputfile: $S1
    $P4 = $P1.'getstring'('o', '')
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9253
# expr: $S2
    $P4 = $P1.'getstring'('e')
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 9254
# noan: $I1
    $P4 = $P1.'getbool'('noan')
    set $I1, $P4
.annotate 'line', 9255
# warn: $I2
    $P4 = $P1.'getbool'('nowarn')
    isfalse $I2, $P4
.annotate 'line', 9257
# argc: $I3
    set $P4, __ARG_1
    set $I3, $P4
.annotate 'line', 9258
# filename: $S3
    null $S3
.annotate 'line', 9259
# var file: $P2
    null $P2
.annotate 'line', 9260
    unless_null $S2, __label_2
# {
.annotate 'line', 9261
    ne $I3, 0, __label_4
# predefined Error
.annotate 'line', 9262
    root_new $P4, ['parrot';'Exception']
    $P4['message'] = 'No file'
    throw $P4
 __label_4: # endif
.annotate 'line', 9264
    $S3 = __ARG_1[0]
.annotate 'line', 9265
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'($S3)
.annotate 'line', 9266
    $P2.'encoding'('utf8')
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 9269
    concat $S0, 'function main[main](argv){', $S2
    concat $S0, $S0, ';}'
    set $S2, $S0
.annotate 'line', 9270
    new $P2, [ 'StringHandle' ]
.annotate 'line', 9271
    $P2.'open'('__eval__', 'w')
.annotate 'line', 9272
    $P2.'puts'($S2)
.annotate 'line', 9273
    $P2.'close'()
.annotate 'line', 9274
    $P2.'open'('__eval__')
.annotate 'line', 9275
    set $S3, '__eval__'
# }
 __label_3: # endif
.annotate 'line', 9278
# var t: $P3
    new $P3, [ 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9280
    'winxed_parser'($P3, $S1, $I2, $I1)
.annotate 'line', 9282
    $P2.'close'()
# }
.annotate 'line', 9283

.end # stage1


.sub 'show_backtrace'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9287
# i: $I1
    set $I1, 1
.annotate 'line', 9288
    iter $P4, __ARG_1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 9289
# var sub: $P2
    $P2 = $P1['sub']
.annotate 'line', 9290
# subname: $S1
    null $S1
.annotate 'line', 9291
    if_null $P2, __label_2
# {
.annotate 'line', 9292
    set $S1, $P2
.annotate 'line', 9293
# ns: $S2
    $P5 = $P2.'get_namespace'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 9294
    isne $I3, $S2, ''
    unless $I3 goto __label_5
    isne $I3, $S2, 'parrot'
 __label_5:
    unless $I3 goto __label_4
.annotate 'line', 9295
    concat $S0, $S2, '.'
    concat $S0, $S0, $S1
    set $S1, $S0
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 9297
# var ann: $P3
    $P3 = $P1['annotations']
.annotate 'line', 9298
# file: $S3
    $S3 = $P3['file']
.annotate 'line', 9299
    eq $S3, '', __label_6
# {
.annotate 'line', 9300
# line: $I2
    $I2 = $P3['line']
.annotate 'line', 9301
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
.annotate 'line', 9304

.end # show_backtrace


.sub 'main' :main
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9308
# retval: $I1
    null $I1
.annotate 'line', 9309
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_0
    $P2.'min_severity'(2)
    $P2.'max_severity'(2)
    $P2.'handle_types'(555, 556, 557)
    push_eh $P2
# try: begin
.annotate 'line', 9315
    'stage1'(__ARG_1)
# try: end
    pop_eh
    goto __label_1
.annotate 'line', 9309
# catch
 __label_0:
    .get_results($P1)
    finalize $P1
    pop_eh
# {
.annotate 'line', 9318
# msg: $S1
    $S1 = $P1['message']
.annotate 'line', 9319
# type: $I2
    $I2 = $P1['type']
.annotate 'line', 9320
    set $I3, $I2
    set $I4, 556
    if $I3 == $I4 goto __label_4
    set $I4, 557
    if $I3 == $I4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 9323
# predefined cry
    getstderr $P0
    print $P0, 'Error: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9324
    set $I1, 1
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 9327
# predefined cry
    getstderr $P0
    print $P0, 'INTERNAL ERROR: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9328
    $P2 = $P1.'backtrace'()
    'show_backtrace'($P2)
.annotate 'line', 9329
    set $I1, 2
 __label_2: # switch end
# }
# catch end
 __label_1:
.annotate 'line', 9332
# predefined exit
    exit $I1
# }
.annotate 'line', 9333

.end # main

# End generated code
